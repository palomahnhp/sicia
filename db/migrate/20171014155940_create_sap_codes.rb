class CreateSapCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :sap_codes do |t|
      t.string :sap_field, index: true
      t.string :sicia_att, index: true
      t.string :code, index: true
      t.string :description

      t.string :updated_by
      t.timestamps
    end
  end
end
