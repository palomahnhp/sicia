class ManagerBody < ApplicationRecord
  include Codifiable

  belongs_to :society

end
