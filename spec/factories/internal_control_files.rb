FactoryGirl.define do
  factory :ic_file do
    trading_year Date.today.year
    code 'CODE'
    sequence(:description) { |n| "Description of area #{n}" }
    updated_by 'FACTORY'

  end
end
