class ChangeManagerBodies < ActiveRecord::Migration[5.0]
  def change
    rename_column :manager_bodies, :budget_center, :description
    remove_column :manager_bodies, :budget_section
    add_reference :manager_bodies, :society, index:true, foreing_key: true
  end
end
