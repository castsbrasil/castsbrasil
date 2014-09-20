class Score < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :value, numericality: { only_integer: true }, presence: true
end
