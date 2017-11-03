class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.integer :trading_year, index: true
      t.string  :sap_proposal
      t.string  :file_number

      t.belongs_to :internal_control_file, index: true, foreign_key: true
      t.belongs_to :internal_control_procedure, index: true, foreign_key: true
      t.belongs_to :internal_control_action, index: true, foreign_key: true
      t.string :title

      t.string :manager_body
      t.string :approval_body
      t.decimal :amount, :precision => 15, :scale => 2


      t.string :sap_kind
      t.string :accounting_document
      t.string :expense_nature
      t.string :contract_type
      t.string :adjudication_way
      t.string :third_party_name
      t.string :third_party_id
      t.string :third_party_nit
      t.string :gexap_task

      t.date :received_at
      t.string :notify_to

      t.text   :observations

      t.timestamps
      t.string :updated_by
      t.timestamps
    end
  end
end
