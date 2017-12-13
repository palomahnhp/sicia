class IcFile < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :ic_procedures
  has_many :proposals

  validates :code, length: {is: 4}

  validates :updated_by, presence: true

  default_scope { order(code: :asc) }

end
