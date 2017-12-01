class CreateIcActionRequeriments < ActiveRecord::Migration[5.0]
  def change
    create_table :ic_action_requeriments do |t|
      t.belongs_to :ic_action
      t.belongs_to :requeriment

      t.timestamps
      t.timestamps
      t.string     :updated_by
    end

  end
end
