class AddSlugToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :slug, :string
  end
end
