class RequerimentCheck < ApplicationRecord
  include Annualizable
  include Codifiable

  validates :kind, presence: true,
                   inclusion: { in: %w(RB CP) }
  validates :code, numericality: { only_integer: true }
  validates :non_observance_level, presence: true
  validates :discrepancy_allowed, presence: true


  default_scope { where(trading_year:  Date.today.year) }

  scope :basic_req, -> { where(:kind => 'RB') }
  scope :permanent_control, -> { where(kind: 'CP') }
  scope :trading_year, lambda { |year| where(trading_year: year) }

end
