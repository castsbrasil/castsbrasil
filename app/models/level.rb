class Level < ActiveRecord::Base
  belongs_to :role
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :required_score, numericality: { only_integer: true }, allow_nill: false

  def self.by_score(score)
    Level.order(required_score: :desc).where("required_score <= ?", score).first
  end
end
