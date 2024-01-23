# frozen_string_literal: true

module Types
  class UniverseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :characters, [Types::CharacterType], null: false
  end
end
