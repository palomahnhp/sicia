class AddColumnsToProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    add_column :proposal_requeriments, :initial_check, :boolean
    add_column :proposal_requeriments, :revised_check, :boolean
  end
end
