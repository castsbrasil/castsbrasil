class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user, index: true
      t.integer :value, null: false
      t.string :description

      t.timestamps
    end
  end
end
