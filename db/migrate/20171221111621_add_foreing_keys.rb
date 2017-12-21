class AddForeingKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :proposals, :manager_bodies
    add_foreign_key :proposals, :approval_bodies
    add_foreign_key :proposals, :societies

    add_foreign_key :proposal_requeriments, :proposals
    add_foreign_key :proposal_requeriments, :requeriments

    add_foreign_key :ic_action_requeriments, :ic_actions
    add_foreign_key :ic_action_requeriments, :requeriments
  end
end
