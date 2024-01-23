# frozen_string_literal: true

RSpec.describe Queries::CharactersQuery, type: :query do
  describe 'characters query' do
    it 'returns all characters' do
      characters = create_list(:character, 3)

      query = <<-GRAPHQL
        query {
          characters {
            id
            name
            race
            powerLevel
          }
        }
      GRAPHQL

      result = TryingGraphqlSchema.execute(query)

      characters_result = result['data']['characters']

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
