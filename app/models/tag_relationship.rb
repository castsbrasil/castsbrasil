class TagRelationship < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true, counter_cache: :taggables_count
  belongs_to :tag
end
