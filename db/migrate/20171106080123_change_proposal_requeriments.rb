class ChangeProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    rename_column :proposals_requeriments, :proposals_id, :proposal_id
    rename_column :proposals_requeriments, :requeriments_check_id, :requeriment_id
    rename_column :proposals_requeriments, :updated_at, :initial_updated_at
    remove_column :proposals_requeriments, :initial_meet
    rename_column :proposals_requeriments, :revision_meet, :revision_updated_at
  end
end
