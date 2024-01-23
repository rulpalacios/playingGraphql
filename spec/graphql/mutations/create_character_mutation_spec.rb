# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateCharacterMutation, type: :mutation do
  describe 'create character' do
    it 'creates a character and returns the details' do
      universe = create(:universe)

      mutation = <<-GRAPHQL
        mutation {
          createCharacter(input: {
            name: "Krilin",
            race: "Human",
            powerLevel: 1000,
            universeId: #{universe.id}
          }) {
            character {
              id
              name
              race
              powerLevel
              universe {
                id
                name
              }
            }
            errors
          }
        }
      GRAPHQL

      result = TryingGraphqlSchema.execute(mutation)

      character_result = result['data']['createCharacter']['character']
      errors_result = result['data']['createCharacter']['errors']

      expect(errors_result).to be_empty
      expect(character_result['id']).to be_present
      expect(character_result['name']).to eq('Krilin')
      expect(character_result['race']).to eq('Human')
      expect(character_result['powerLevel']).to eq(1_000)
      expect(character_result['universe']['id']).to eq(universe.id.to_s)
      expect(character_result['universe']['name']).to eq(universe.name)
    end
  end
end
