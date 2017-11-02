class ManagerBody < ApplicationRecord

  validates :code, :budget_center, :budget_section,
            presence: true

  def budget_center_code
    code[0..2]
  end

  def budget_section_code
    code[3..5]
  end

end
