class DropTagRelationships < ActiveRecord::Migration
  def up
    drop_table :tag_relationships
  end

  def down
    create_table(:tag_relationships) do |t|
      t.integer :taggable_id
      t.string :taggable_type
      t.integer :tag_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
