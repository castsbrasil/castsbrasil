class AddNotesToCasts < ActiveRecord::Migration
  def up
    add_column :casts, :notes, :text
  end

  def down
    remove_column :casts, :notes
  end
end
