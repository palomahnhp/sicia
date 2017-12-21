class AddProposalNumberAndSocietyToProposals < ActiveRecord::Migration[5.0]
  def change
    add_reference :proposals, :society, index:true, foreing_key: true
    add_column   :proposals, :sicia_number, :integer
  end
end
