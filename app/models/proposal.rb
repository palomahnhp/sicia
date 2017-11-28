class Proposal < ApplicationRecord
  include Annualizable
  include PublicActivity::Model

  tracked owner: ->(controller, model) { controller && controller.current_user },
          params: {
              aci_file:  -> (controller, model) { controller && controller.params[:proposal][:internal_control_file]},
              aci_procedure: -> (controller, model) { controller && controller.params[:proposal][:internal_control_procedure]},
              aci_action: -> (controller, model) { controller && controller.params[:proposal][:internal_control_action]}
          }
  belongs_to :internal_control_file
  belongs_to :internal_control_procedure
  belongs_to :internal_control_action
  has_many :requeriments throw

  validates :internal_control_file,
            :internal_control_procedure,
            :internal_control_action,
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
    %i(trading_year
       sap_kind
       file_number
       accounting_document
       amount
       expense_nature
       manager_body
       approval_body
       adjudication_way
       third_party_name
       third_party_id
       third_party_nit
       contract_type
       title)
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
    %i(trading_year
       file_number
       sap_proposal
       amount
       manager_body
       approval_body
       third_party_name
       third_party_id
       third_party_nit
       title
       received_at )
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(trading_year sap_proposal file_number title third_party_name third_party_id third_party_nit received_at amount ) + _ransackers.keys
  end

  def fill_sap_proposal(sap_proposal)
    self.sap_proposal = sap_proposal
    self.trading_year = 2017
    self.sap_kind = 'CONTA'
    self.file_number = '300/2017/012356'
    self.accounting_document = SapCode.accounting_document.reorder("RANDOM()").first.description
    self.amount = rand(100000..90000000) / 100
    self.title = Faker::Lorem.sentence
    self.manager_body = '001010'
    self.approval_body = '01'
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
end
