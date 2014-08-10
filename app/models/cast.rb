class Cast < ActiveRecord::Base
  include Taggable
  
  scope :find_by_param, -> (param) { find(param) }
  belongs_to :user
end
