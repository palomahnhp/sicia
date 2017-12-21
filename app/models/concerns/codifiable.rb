require 'active_support/concern'
module Codifiable
  extend ActiveSupport::Concern

  included do
    validates :code,
              presence: true
    validates :description,
              presence: true

    def self.ransackable_attributes(auth_object = nil)
      %w(code description) + _ransackers.keys
    end

    def code_and_description
      "#{code} #{description}"
    end
  end

end
