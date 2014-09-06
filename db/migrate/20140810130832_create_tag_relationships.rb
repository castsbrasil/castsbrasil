class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.references :taggable, polymorphic: true, index: true, counter_cache: :taggables_count
      t.references :tag, index: true

      t.timestamps
    end
  end
end
