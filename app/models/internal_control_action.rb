class InternalControlAction < ApplicationRecord
  belongs_to :internal_control_procedure

  validates :trading_year, presence: true,
                           inclusion: { in: 2017..Date.today.year },
                           format: { with: /(19|20)\d{2}/i }
  validates :code, presence: true,
            length: { is: 2 },
            numericality: { only_integer: true }
  validates :description, presence: true

end
