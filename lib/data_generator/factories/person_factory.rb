require 'factory_girl'
require 'faker'
require 'data_generator/model'
require 'active_support/core_ext/integer/time'

FactoryGirl.define do
  factory :person, class: DataGenerator::Model do
    sequence(:contact_id) { |n| "C#{n}" }
    sequence(:signed_up_id) { |n| "S#{n}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { rand > 0.5 ? Faker::Pokemon.name : nil }
    email { Faker::Internet.email }
    gender { rand >= 0.5 ? 'm' : 'f' }
    ip_address { Faker::Internet.ip_v4_address }
    company { Faker::Company.name }
    address_1 { Faker::Address.street_address }
    address_2 { Faker::Address.secondary_address }
    address_3 { '' }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    country { Faker::Address.country }
    full_address { [address_1, address_2, address_3, city, postcode, country].select(&:present?).join(', ') }
    age { Faker::Number.between(13, 80) }
    date_of_birth { age.years.ago }
    home_phone_number { Faker::PhoneNumber.phone_number }
    mobile_phone_number { Faker::PhoneNumber.cell_phone }
    job_title { Faker::Name.title }
    title { Faker::Name.prefix }
    full_name { [title, first_name, middle_name, last_name].select(&:present?).join(' ') }
  end
end