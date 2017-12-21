class CreateRelationProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    create_table   :proposal_requeriments do |t|
      t.belongs_to :proposal
      t.belongs_to :requeriment

      t.timestamps
      t.timestamps
      t.string     :updated_by

      t.datetime   :revision_updated_at
      t.string     :revision_updated_by
    end
  end
end
