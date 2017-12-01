FactoryGirl.define do
  factory :ic_action do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description  "Description of action"
    association :ic_procedure
    updated_by 'FACTORY'

  end
end
