class Society < ApplicationRecord
  include Codifiable

  has_many :proposals
  has_many :manager_bodies

end
