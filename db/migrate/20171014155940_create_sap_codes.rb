class CreateSapCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :sap_codes do |t|
      t.string :field, index: true
      t.string :code, index: true
      t.string :description

      t.string :updated_by
      t.timestamps
    end
  end
end
