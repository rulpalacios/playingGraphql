# frozen_string_literal: true

module Queries
  class CharactersByUniverseQuery < Queries::BaseQuery
    description 'Find all characters by universe'

    argument :universe_name, String, required: true

    type [Types::CharacterType], null: false

    def resolve(universe_name:)
      Universe.find_by(name: universe_name).characters
    end
  end
end
