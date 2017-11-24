class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @search = Proposal.search(params[:q])
    @proposals = @search.result
    @search.build_condition if @search.conditions.empty?
  end

  def show

  end

  def edit

  end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal
    else
      render :show
    end
  end

  def new
    @proposal = Proposal.new()
    @proposal.fill_sap_proposal(params[:sap_proposal]) if params[:sap_proposal].present?
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      flash[:notice] = t('flash.proposals.create.success')
      redirect_to @proposal
    else
      render :new
    end
  end

  def select_type

  end

  def add_requeriment
    @requeriment = Requeriment.find(paramenter[:requeriment_id])
    @proposal.requeriments << @requeriment
    flash[:notice] = t('flash.proposals.add_requeriment.success')
    redirect_to @proposal
  end

  private

  def proposal_params
    params.require(:proposal).permit(:trading_year,
                                     :internal_control_file_id,
                                     :internal_control_procedure_id,
                                     :internal_control_action_id,
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
                                     :notify_to_confirmation
    )
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

end
