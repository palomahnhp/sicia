class Proposal < ApplicationRecord
  include Annualizable
  include PublicActivity::Model

  tracked owner: ->(controller, model) { controller && controller.current_user },
          params: {
              aci_file:  -> (controller, model) { controller && controller.params[:proposal][:ic_file]},
              aci_procedure: -> (controller, model) { controller && controller.params[:proposal][:ic_procedure]},
              aci_action: -> (controller, model) { controller && controller.params[:proposal][:ic_action]}
          }
  belongs_to :society
  belongs_to :manager_body
  belongs_to :approval_body

  belongs_to :ic_file
  belongs_to :ic_procedure
  belongs_to :ic_action

  has_many :proposal_requeriments
  has_many :requeriments, through: :proposal_requeriments

  accepts_nested_attributes_for :proposal_requeriments
  accepts_nested_attributes_for :requeriments

  validates :sicia_number,
            :ic_file,
            :ic_procedure,
            :ic_action,
            :accounting_document,
            :expense_nature,
            presence: true,
            if: Proc.new { |a| a.automatic_proposal? }

  validates_uniqueness_of :sap_proposal

  validates :file_number,
  :manager_body,
  :title,
  :approval_body,
  :received_at,
  presence: true

  validates :amount, presence: true, numericality: true

  validates :notify_to, :confirmation => true,
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :notify_to_confirmation, :presence => true

  def automatic_proposal?
     sap_proposal.present?
  end

  def manual_proposal?
    !sap_proposal.present?
  end

  def self.main_columns_automatic_sap
    %i(sicia_number
       file_number
       sap_proposal
       title
       amount
       accounting_document
       contract_type
       expense_nature
       adjudication_way
       manager_body_id
       approval_body_id
       society_id
       sap_kind
       third_party_name
       third_party_id
       third_party_nit
       trading_year
       )
  end

  def self.main_columns_manual
    %i(trading_year
       file_number
       title
       amount
       manager_body
       approval_body
       third_party_name
       third_party_id
       third_party_nit)
  end

  def self.index_columns
    %i(sicia_number
       file_number
       sap_proposal
       manager_body
       approval_body
       title
       amount
       received_at )
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(trading_year sicia_number sap_proposal file_number title third_party_name third_party_id third_party_nit received_at amount ) + _ransackers.keys
  end

  def fill_sap_proposal(sap_proposal)
    self.sap_proposal = sap_proposal
    self.trading_year = 2017
    self.manager_body = ManagerBody.all.reorder("RANDOM()").first
    self.approval_body = ApprovalBody.all.reorder("RANDOM()").first
    self.society_from_manager_body
    self.sap_kind = 'CONTA'
    self.file_number = '300/2017/012356'
    self.accounting_document = SapCode.accounting_document.reorder("RANDOM()").first.description
    self.amount = rand(100000..90000000) / 100
    self.title = Faker::Lorem.sentence
    self.expense_nature = SapCode.expense_nature.reorder("RANDOM()").first.description
    self.contract_type = SapCode.contract_type.reorder("RANDOM()").first.description
    self.adjudication_way = SapCode.adjudication_way.reorder("RANDOM()").first.description
    if %w(F J).shuffle.first == 'F'
      self.third_party_name = Faker::Name.name
      self.third_party_id = rand(1..3) % 2 == 0 ? Faker::NIF.nie : Faker::NIF.nif
    else
      self.third_party_name = Faker::Company.name
      self.third_party_id   = Faker::NIF.cif
    end
    self.third_party_nit = rand(100000..900000)
    self.received_at = Date.today
  end

  def proposal_requeriment(requeriment)
    proposal_requeriments.where(requeriment_id: requeriment.id).take
  end

  def assign_sicia_number
    prop =  Proposal.where(trading_year: trading_year, society: society).order("sicia_number DESC").first
    self.sicia_number = prop.present? && prop.sicia_number.nil? ?  prop.sicia_number + 1 :  1
  end

  def society_from_manager_body
   society_code = self.manager_body.code[0..2]
   society_code = society_code == '001' ? 'MDRD' : society_code
   self.society = Society.find_by_code(society_code)
  end

  def formatted_sicia_number
    "#{self.society.code}/#{self.trading_year}/#{self.sicia_number.to_s.rjust(6, "0")}"
  end
end
