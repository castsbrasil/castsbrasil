class Link < ActiveRecord::Base
  belongs_to :profile

  validates :name, :url, presence: true
  validates :url, format: /\Ahttps?:\/\/.*\z/
end
