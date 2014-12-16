class CreateCastsTags < ActiveRecord::Migration
  def change
    create_table(:casts_tags, id: false) do |t|
      t.references :cast
      t.references :tag
    end

    add_index :casts_tags, %i(cast_id tag_id), unique: true
  end
end
