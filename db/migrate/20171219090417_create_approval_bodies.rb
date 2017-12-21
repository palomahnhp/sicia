class CreateApprovalBodies < ActiveRecord::Migration[5.0]
  def change
    create_table :approval_bodies do |t|
      t.integer :trading_year, index: true
      t.string  :code, index: true
      t.string  :description
      t.date    :valid_to
      t.timestamps
    end
  end
end
