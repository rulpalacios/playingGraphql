# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.integer :power_level
      t.references :universe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
