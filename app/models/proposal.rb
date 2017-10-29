class Proposal < ApplicationRecord
  include Annualizable

  belongs_to :internal_control_file
  belongs_to :internal_control_procedure
  belongs_to :internal_control_action
  has_and_belongs_to_many :requeriments


  validates :internal_control_file,
            :internal_control_procedure,
            :internal_control_action,
            :accounting_document,
            :expense_nature,
            presence: true,
            if: Proc.new { |a| a.automatic_proposal? }

  validates :file_number,
            :manager_body,
            :title,
            :approval_body,
            presence: true

  validates :amount, presence: true, numericality: true

  def automatic_proposal?
     sap_proposal.present?
  end

  def manual_proposal?
    !sap_proposal.present?
  end
end
