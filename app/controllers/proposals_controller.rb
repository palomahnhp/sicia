class ProposalsController < ApplicationController

  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @proposal = Proposal.new(sap_proposal: params[:sap_proposal])
    @proposal.fill_sap_proposal
  end

  def select_type

  end

  private

  def proposal_params
    params.require(:proposals).permit(:trading_year,
                                      :internal_control_file,
                                      :internal_control_procedure,
                                      :internal_control_action,
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
                                      :observations )
  end

  def set_proposal
    @proposal = find(params[:id])
  end

end
