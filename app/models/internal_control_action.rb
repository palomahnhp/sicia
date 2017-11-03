class InternalControlAction < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :proposals
  belongs_to :internal_control_procedure

  validates :code, length: { minimum: 1, maximum: 2 },
                   numericality: { only_integer: true }
  validates :updated_by, presence: true

  default_scope { order(code: :asc) }
end
