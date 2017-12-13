require 'faker'

FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    first_surname {Faker::Name.last_name}
    second_surname {Faker::Name.last_name}
    document_number {Faker::NIF.nif}
    document_type "NIF"
    pernr Faker::Number.number(8)
    ayre "USU" + Faker::Number.number(3)
    uweb_id  Faker::Number.number(8)
    email {Faker::Internet.email}
    password "123456789"
  end
end
