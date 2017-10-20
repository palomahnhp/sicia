class InternalControlArea < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :internal_control_procedures
  validates :code, length: {is: 4}

  validates :update_by, presence: true

end
