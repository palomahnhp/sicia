class CreateManagerBodies < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_bodies do |t|
      t.integer :trading_year, index: true
      t.string  :code, index: true
      t.string  :budget_center
      t.string  :budget_section

      t.timestamps
    end
  end
end
