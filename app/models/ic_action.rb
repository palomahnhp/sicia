class IcAction < ApplicationRecord
  include Annualizable
  include Codifiable

  belongs_to :ic_procedure
  has_many :proposals
  has_many :ic_action_requeriments
  has_many :requeriments, through: :ic_action_requeriments

  validates :code, length: { minimum: 1, maximum: 2 },
                   numericality: { only_integer: true }
  validates :updated_by, presence: true

  default_scope { order(code: :asc) }
end
