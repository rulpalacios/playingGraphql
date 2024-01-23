# frozen_string_literal: true

module Queries
  class CharactersQuery < Queries::BaseQuery
    description 'Find all characters'

    argument :name, String, required: false
    argument :race, String, required: false
    argument :universe_name, String, required: false

    type [Types::CharacterType], null: false

    def resolve(name: nil, race: nil, universe_name: nil)
      characters = Character.all
      characters = characters.where(name:) if name.present?
      characters = characters.where(race:) if race.present?

      characters = characters.joins(:universe).where(universes: { name: universe_name }) if universe_name.present?

      characters
    end
  end
end
