class RenameInternalControlProcedureToIcProcedure < ActiveRecord::Migration[5.0]
  def change
    rename_table :internal_control_procedures, :ic_procedures
  end
end
