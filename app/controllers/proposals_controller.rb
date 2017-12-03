class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update, :destroy, :mark_requeriment]

  def index
    @search = Proposal.search(params[:q])
    @proposals = @search.result
    @search.build_condition
  end

  def show

  end

  def edit

  end

  def update
    if @proposal.update(proposal_params)
      flash[:notice] = t('flash.update.success', resource: t('activerecord.models.proposal.one'))
      redirect_to @proposal
    else
      flash[:error] = t('flash.update.error', resource:  t('activerecord.models.proposal.one'))
      render :edit
    end
  end

  def new
    @proposal = Proposal.new()
    @proposal.fill_sap_proposal(params[:sap_proposal]) if params[:sap_proposal].present?
   end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.requeriments << @proposal.ic_action.requeriments
    if @proposal.save
      flash[:notice] = t('flash.create.success', resource: t('activerecord.models.proposal.one'))
      redirect_to mark_requeriment_proposal_path(@proposal)
    else
      flash[:error] = t('flash.create.error', resource:  t('activerecord.models.proposal.one'))
      render :new
    end
  end

  def select_type

  end

  def mark_requeriment

  end

  private

  def proposal_params
    params.require(:proposal).permit(:trading_year,
                                     :ic_file_id,
                                     :ic_procedure_id,
                                     :ic_action_id,
                                     :title,
                                     :file_number,
                                     :manager_body,
                                     :approval_body,
                                     :amount,
                                     :sap_proposal,
                                     :sap_kind,
                                     :accounting_document,
                                     :expense_nature,
                                     :contract_type,
                                     :adjudication_way,
                                     :third_party_name,
                                     :third_party_id,
                                     :third_party_nit,
                                     :gexap_task,
                                     :observations,
                                     :received_at,
                                     :notify_to,
                                     :notify_to_confirmation,
                                     proposal_requeriments_attributes: [
                                         :requeriment_id,
                                         :revision_updated_at,
                                         :revision_updated_by,
                                         :initial_check,
                                         :revised_check ]
    )
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

end
