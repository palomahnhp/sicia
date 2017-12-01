class ProposalRequeriment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :requeriment

end