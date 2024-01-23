# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Universes

universe_7 = Universe.create(name: 'Universe 7')
universe_6 = Universe.create(name: 'Universe 6')

# Characters

Character.create(name: 'Goku', race: 'Saiyan', power_level: 9000, universe: universe_7)
Character.create(name: 'Vegeta', race: 'Saiyan', power_level: 8000, universe: universe_7)
Character.create(name: 'Hit', race: 'Unknown', power_level: 9500, universe: universe_6)
