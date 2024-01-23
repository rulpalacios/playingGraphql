# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::CharactersByUniverseQuery, type: :query do
  describe 'characters by universe' do
    it 'returns characters for a given universe' do
      universe = create(:universe)
      characters = create_list(:character, 3, universe:)

      query = <<-GRAPHQL
        query {
          charactersByUniverse(universeName: "#{universe.name}") {
            id
            name
            race
            powerLevel
          }
        }
      GRAPHQL

      result = TryingGraphqlSchema.execute(query)

      characters_result = result['data']['charactersByUniverse']

      expect(characters_result.count).to eq(3)

      characters_result.each_with_index do |character_result, index|
        expect(character_result['id']).to eq(characters[index].id.to_s)
        expect(character_result['name']).to eq(characters[index].name)
        expect(character_result['race']).to eq(characters[index].race)
        expect(character_result['powerLevel']).to eq(characters[index].power_level)
      end
    end
  end
end
