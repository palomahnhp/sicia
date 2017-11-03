class SapCode < ApplicationRecord
  include Codifiable

  validates :sap_field,
            presence: true

  scope :accounting_document,      -> { where(sap_field: 'CODMOD') }
  scope :gexap_task,               -> { where(sap_field: 'TRAMITE') }
  scope :expense_nature,           -> { where(sap_field: 'NATURALEZA') }
  scope :adjudication_way,         -> { where(sap_field: 'FORMA_ADJUD') }
  scope :contract_type,            -> { where(sap_field: 'TIPOCONTRATO') }
  scope :manager_body,             -> { where(sap_field: 'ORGGEST') }
  scope :approval_body,            -> { where(sap_field: 'ORGAPRO') }

end
