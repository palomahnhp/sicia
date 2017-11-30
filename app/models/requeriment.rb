class Requeriment < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :proposal_requeriments
  has_many :proposals, through: :proposal_requeriments

  has_many :internal_control_action_requeriments
  has_many :internal_control_actions, through: :internal_control_action_requeriments

  validates :kind, presence: true,
                   inclusion: { in: %w(RB CP DOC) }
  validates :code, numericality: { only_integer: true }
  validates :non_observance_level, presence: true
  validates :discrepancy_allowed, presence: true

  default_scope { where(trading_year:  Date.today.year) }

  scope :basic_req, -> { where(:kind => 'RB') }
  scope :permanent_control, -> { where(kind: 'CP') }
  scope :document, -> { where(kind: 'DOC') }
  scope :trading_year, lambda { |year| where(trading_year: year) }

end
