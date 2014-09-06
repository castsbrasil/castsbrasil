class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :taggables_count, default: 0
      t.timestamps
    end
  end
end
