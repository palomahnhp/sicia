class CreateInternalControlProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_control_procedures do |t|
      t.string :trading_year, index: true
      t.string :code, index: true
      t.string :description
      t.belongs_to :internal_control_area, index: true, foreign_key: true

      t.string :updated_by
      t.timestamps
      t.timestamps
    end
  end
end
