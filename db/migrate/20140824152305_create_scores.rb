class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user, index: true
      t.integer :value, null: false
      t.string :description

      t.timestamps
    end
  end
end
