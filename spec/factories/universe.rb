# frozen_string_literal: true

FactoryBot.define do
  factory :universe do
    name { "Universe #{Faker::Number.between(from: 1, to: 7)}" }
  end
end
