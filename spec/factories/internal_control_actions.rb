FactoryGirl.define do
  factory :internal_control_action do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description  "Description of action"
    association :internal_control_procedure
    updated_by 'FACTORY'

  end
end
