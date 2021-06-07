# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    doctor { true }
  end
end
