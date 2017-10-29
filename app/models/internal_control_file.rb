class InternalControlFile < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :internal_control_procedures
  has_many :proposals

  validates :code, length: {is: 4}

  validates :updated_by, presence: true

end
