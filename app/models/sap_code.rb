class SapCode < ApplicationRecord

  scope :tipo_intervencion,     -> { where(field: 'ZTIPO_INTERV') }
  scope :codigo_modelo,         -> { where(field: 'CODMOD') }
  scope :tramite,               -> { where(field: 'TRAMITE') }
  scope :naturaleza,            -> { where(field: 'NATURALEZA') }

end
