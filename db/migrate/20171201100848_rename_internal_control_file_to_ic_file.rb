class RenameInternalControlFileToIcFile < ActiveRecord::Migration[5.0]
  def change
    rename_table :internal_control_files, :ic_files
  end
end
