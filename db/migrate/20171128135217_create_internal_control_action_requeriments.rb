class CreateInternalControlActionRequeriments < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_control_action_requeriments do |t|
      t.belongs_to :internal_control_action, index: false
      t.belongs_to :requeriment

      t.timestamps
      t.timestamps
      t.string     :updated_by
    end

    add_index :internal_control_action_requeriments, [:internal_control_action_id, :requeriment_id], unique: true, name: 'internal_control_action'
  end
end
