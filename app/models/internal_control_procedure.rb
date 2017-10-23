class InternalControlProcedure < ApplicationRecord
  include Annualizable
  include Codifiable

  belongs_to :internal_control_area
  has_many :internal_control_actions
  validates :code, length: { minimum: 1, maximum: 2 },
            numericality: { only_integer: true }
  validates :update_by, presence: true

end
