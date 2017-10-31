FactoryGirl.define do
  factory :proposals do
    trading_year Date.today.year
    sequence(:file_number, 1, 99999 ) { |n| "Exp/#{n}" }
    manager_body '001010'
    approval_body '001'
    title 'Titulo de la Propuesta '
    amount Random.rand

    third_party_name Faker.name
    sequence(:third_party_id, 30000000, 799999999 ) { |n| "#{n}F" }
    sequence(:third_party_nit, 1, 99999 ) { |n| "T/#{n}" }

    association :internal_control_file

    trait :sap_proposal do
      sequence(:sap_proposal, 10000000, 90000000)
      accounting_document 'A'
      sap_kind 'CONTA'
      expense_nature 'ANUAL'
      association :internal_control_procedure
      association :internal_control_action
    end

  end
end
