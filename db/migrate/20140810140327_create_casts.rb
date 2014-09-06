class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
