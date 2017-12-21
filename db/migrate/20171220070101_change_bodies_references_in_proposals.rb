class ChangeBodiesReferencesInProposals < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :manager_body
    add_reference :proposals, :manager_body, index:true, foreing_key: true
    remove_column :proposals, :approval_body
    add_reference :proposals, :approval_body, index:true, foreing_key: true
  end
end
