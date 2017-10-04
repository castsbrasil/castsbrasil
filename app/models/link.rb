class Link < ApplicationRecord
  belongs_to :profile

  validates :name, :url, presence: true
  validates :url, domain_name: true
end
