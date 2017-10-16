class InternalControlAction < ApplicationRecord
  include Annualizable
  include Codifiable

  belongs_to :internal_control_procedure
  validates :code, length: { minimum: 1, maximum: 2 },
                   numericality: { only_integer: true }

end
