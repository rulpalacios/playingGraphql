# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    name { Faker::JapaneseMedia::DragonBall.character }
    race { Faker::JapaneseMedia::DragonBall.race }
    power_level { Faker::Number.between(from: 1, to: 10_000) }
    universe
  end
end
