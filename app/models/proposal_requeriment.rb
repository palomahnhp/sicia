class ProposalRequeriment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :requeriment

  def update_data
    if initial_check.present?
      updated_by + '-' + updated_at
    else
      I18n.t('proposal_requeriment.verification.pending')
    end
  end

  def humanize_initial_check
    initial_check.nil? ? '-' : I18n.t("proposal_requeriment.verification.#{initial_check.to_s}" )
  end
end