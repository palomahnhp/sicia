class ApprovalBody < ApplicationRecord
  include Codifiable

  has_many :proposals
end
