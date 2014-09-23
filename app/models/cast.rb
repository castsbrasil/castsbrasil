class Cast < ActiveRecord::Base
  include Taggable
  belongs_to :user
  validates_presence_of :name, :url
  scope :find_by_param, -> (param) { find(param) }
end
