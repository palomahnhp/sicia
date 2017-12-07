class ProposalRequeriment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :requeriment

  def humanize_initial_check
    initial_check.nil? ? 'Pendiente' : I18n.t("proposal_requeriment.verification.#{initial_check.to_s}" )
  end

  def self.by_proposal_and_kind_requeriment(proposal, kind)
    proposal_requeriments = []
    where(proposal_id: proposal.id).each do |pr|
      proposal_requeriments << pr if pr.requeriment.kind == kind
    end
    proposal_requeriments
  end
end