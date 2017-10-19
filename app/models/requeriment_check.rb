class RequerimentCheck < ApplicationRecord

  validates :kind, presence: true,
                   inclusion: { in: %w(RB CB),
                                message: "%{value} is not a valid value" }

  validates :trading_year, presence: true,
                           inclusion: { in: 1900..Date.today.year },
                           format: {
                               with: /(19|20)\d{2}/i,
                               message: "should be a four-digit year" }

  default_scope :current_trading_year, { where("trading_year = ?", Date.today.year)}
  scope :trading_year, (year), { where("trading_year = ?", year) }
  scope :basic, { where("kind = ?", 'RB')}
  scope :permanent, { where("kind = ?", 'CP')}

end
