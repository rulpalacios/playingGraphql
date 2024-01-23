# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :universe

  validates :name, presence: true
  validates :race, presence: true
  validates :power_level, numericality: { greater_than_or_equal_to: 0 }
end
