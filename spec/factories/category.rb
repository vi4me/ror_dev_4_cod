# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :category do
    title { Faker::ChuckNorris.fact }
    user_id { 1 }
  end
end
