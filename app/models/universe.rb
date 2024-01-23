# frozen_string_literal: true

class Universe < ApplicationRecord
  has_many :characters

  validates :name, presence: true, uniqueness: true
end
