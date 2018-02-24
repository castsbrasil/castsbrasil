# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :value, numericality: { only_integer: true }, presence: true
end
