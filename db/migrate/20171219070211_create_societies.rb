class CreateSocieties < ActiveRecord::Migration[5.0]
  def change
    create_table :societies do |t|
      t.string :code, index: true
      t.string :description

      t.timestamps

    end
  end
end
