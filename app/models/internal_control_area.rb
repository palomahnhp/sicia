class InternalControlArea < ApplicationRecord
  has_many :internal_control_procedures

  validates :trading_year, presence: true,
            inclusion: { in: 2017..Date.today.year },
            format: { with: /(19|20)\d{2}/i }
  validates :code, presence: true
  validates :description, presence: true

end
