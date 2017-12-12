FactoryGirl.define do
  factory :proposal do
    trading_year Date.today.year
    sequence(:file_number, 1, 99999 ) { |n| "Exp/#{n}" }
    manager_body '001010'
    approval_body '001'
    title 'Titulo de la Propuesta '
    amount Random.rand

    third_party_name Faker::Name.name
    sequence(:third_party_id, 30000000, 799999999 ) { |n| "#{n}F" }
    sequence(:third_party_nit, 1, 99999 ) { |n| "T/#{n}" }
    received_at Date.today
    notify_to 'correo@madrid.es'
    notify_to_confirmation 'correo@madrid.es'
    association :ic_file

    trait :sap_proposal do
      sequence(:sap_proposal, 10000000, 90000000)
      accounting_document 'A'
      sap_kind 'CONTA'
      expense_nature 'ANUAL'
      association :ic_procedure
      association :ic_action
    end

  end
end
