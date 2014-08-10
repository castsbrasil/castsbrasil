module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tag_relationships, as: :taggable
    has_many :tags, through: :tag_relationships
  end
end
