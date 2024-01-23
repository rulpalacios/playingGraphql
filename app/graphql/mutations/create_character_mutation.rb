# frozen_string_literal: true

module Mutations
  class CreateCharacterMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :race, String, required: true
    argument :power_level, Integer, required: true
    argument :universe_id, Integer, required: true

    field :character, Types::CharacterType, null: false
    field :errors, [String], null: false

    def resolve(name:, race:, power_level:, universe_id:)
      universe = Universe.find_by(id: universe_id)

      return { character: nil, errors: ['Universe not found'] } if universe.nil?

      character = Character.new(
        name:,
        race:,
        power_level:,
        universe:
      )

      if character.save
        { character:, errors: [] }
      else
        { character: nil, errors: character.errors.full_messages }
      end
    end
  end
end
