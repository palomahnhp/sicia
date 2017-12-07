class Requeriment < ApplicationRecord
  include Annualizable
  include Codifiable

  has_many :proposal_requeriments
  has_many :proposals, through: :proposal_requeriments

  has_many :ic_action_requeriments
  has_many :ic_actions, through: :ic_action_requeriments

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

  def full_code
    kind + code.to_s.rjust(5, "0")
  end

  def proposal_requeriment(proposal)
    proposal_requeriments.where(proposal_id: proposal.id).take
  end
end
