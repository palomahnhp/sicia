class ManagerBody < ApplicationRecord
  include Codifiable

  belongs_to :society
  has_many :proposals
end
