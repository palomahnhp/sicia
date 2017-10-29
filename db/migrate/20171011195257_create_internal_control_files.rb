class CreateInternalControlFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_control_files do |t|
      t.integer :trading_year, index: true
      t.string :code, index: true
      t.string :description

      t.timestamps
      t.string :updated_by
      t.timestamps
    end
  end
end
