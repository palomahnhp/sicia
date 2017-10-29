FactoryGirl.define do
  factory :internal_control_file do
    trading_year Date.today.year
    code 'CODE'
    sequence(:description) { |n| "Description of area #{n}" }
    updated_by 'FACTORY'

  end
end
