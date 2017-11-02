class Proposal < ApplicationRecord
  include Annualizable

  belongs_to :internal_control_file
  belongs_to :internal_control_procedure
  belongs_to :internal_control_action
  has_and_belongs_to_many :requeriments


  validates :internal_control_file,
            :internal_control_procedure,
            :internal_control_action,
            :accounting_document,
            :expense_nature,
            presence: true,
            if: Proc.new { |a| a.automatic_proposal? }

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

  def self.main_columns
    %i(trading_year
       file_number
       amount
       manager_body
       approval_body
       third_party_name
       third_party_id
       third_party_nit
       title
       received_at )
  end



  def fill_sap_proposal
    self.trading_year = 2017
    self.sap_kind = 'CONTA'
    self.file_number = '300/2017/012356'
    self.accounting_document = 'ADO'
    self.amount = 1729.20
    self.title = Faker::Company.catch_phrase
    self.manager_body = '001010'
    self.approval_body = '01'
    self.expense_nature = 'ANUAL'
    self.contract_type = 'no procede'
    self.adjudication_way = 'Adjudicación directa'
    self.third_party_name = Faker::Name.name
    self.third_party_id = '50987323W'
    self.third_party_nit = '1627635'
    self.received_at = Date.today
  end
end
