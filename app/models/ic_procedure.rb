class IcProcedure < ApplicationRecord
  include Annualizable
  include Codifiable

  belongs_to :ic_file
  has_many :ic_actions
  has_many :proposals

  validates :code, length: { minimum: 1, maximum: 2 },
            numericality: { only_integer: true }
  validates :updated_by, presence: true

  default_scope { order(code: :asc) }
end
