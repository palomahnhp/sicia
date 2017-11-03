class CreateRequeriments < ActiveRecord::Migration[5.0]
  def change
    create_table :requeriments do |t|

      t.string :kind, index: true
      t.integer :code, index: true
      t.string :description
      t.string :non_observance_level
      t.string :discrepancy_allowed
      t.string :legal_reference

      t.string :trading_year, index: true
      t.string :updated_by
      t.timestamps  null: false
    end
  end
end
