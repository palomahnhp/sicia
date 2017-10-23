require 'active_support/concern'
module Codifiable
  extend ActiveSupport::Concern

  included do
    validates :code,
              presence: true
    validates :description,
              presence: true
  end

end
