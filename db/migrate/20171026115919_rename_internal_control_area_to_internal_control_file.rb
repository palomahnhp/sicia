class RenameInternalControlAreaToInternalControlFile < ActiveRecord::Migration[5.0]
  def changes
    rename_table :internal_control_areas, :internal_control_files
  end
end
