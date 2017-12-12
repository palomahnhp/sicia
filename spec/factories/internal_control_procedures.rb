FactoryGirl.define do
  factory :ic_procedure do
    trading_year Date.today.year
    sequence(:code, 1, 99 ) { |n| n }
    description "Description of procedure"
    association :ic_file
    updated_by 'FACTORY'
  end
end
