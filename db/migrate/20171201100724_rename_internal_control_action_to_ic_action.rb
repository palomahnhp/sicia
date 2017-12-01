class RenameInternalControlActionToIcAction < ActiveRecord::Migration[5.0]
  def change
    rename_table :internal_control_actions, :ic_actions
  end
end
