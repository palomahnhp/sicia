require 'active_support/concern'
module Annualizable
  extend ActiveSupport::Concern

  included do
    validates :trading_year, presence: true,
 #             inclusion: { in: 2017..Date.today.year+1 },
              format: { with: /(19|20)\d{2}/i }
  end

end
