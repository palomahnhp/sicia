class RenameInternalControlActionRequerimentToIcActionRequeriment < ActiveRecord::Migration[5.0]
  def change
    rename_table :internal_control_action_requeriments, :ic_action_requeriments
  end
end
