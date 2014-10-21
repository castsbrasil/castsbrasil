class Level < ActiveRecord::Base
  belongs_to :role
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :required_score, numericality: { only_integer: true }, allow_nill: false

  scope :by_score, ->(score) { where("required_score <= ?", score).order(required_score: :desc) }
end
