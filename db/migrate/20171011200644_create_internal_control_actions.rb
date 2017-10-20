class CreateInternalControlActions < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_control_actions do |t|
      t.integer :trading_year, index: true
      t.integer :code, index: true
      t.string :description
      t.belongs_to :internal_control_procedure, index: true, foreign_key: true

      t.timestamps
      t.string :updated_by
      t.timestamps
    end
  end
end
