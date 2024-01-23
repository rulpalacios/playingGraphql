# frozen_string_literal: true

module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :race, String, null: false
    field :power_level, Integer, null: false
    field :universe, Types::UniverseType, null: false
  end
end
