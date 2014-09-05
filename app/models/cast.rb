class Cast < ActiveRecord::Base
  include Taggable

  validates_presence_of :name, :url
  
  scope :find_by_param, -> (param) { find(param) }
  belongs_to :user
end
