class CreateRelationProposalRequeriments < ActiveRecord::Migration[5.0]
  def change
    create_table   :proposals_requeriments, id: false do |t|
      t.belongs_to :proposals
      t.belongs_to :requeriments_check
      t.boolean    :initial_meet
      t.timestamps :initial_review_at
      t.string     :initial_updated_by
      t.boolean    :revision_meet
      t.timestamps :revision_review
      t.string     :revision_updated_by
    end
  end
end
