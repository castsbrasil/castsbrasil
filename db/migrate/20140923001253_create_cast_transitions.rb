class CreateCastTransitions < ActiveRecord::Migration
  def change
    create_table :cast_transitions do |t|
      t.string :to_state
      t.text :metadata, default: "{}"
      t.integer :sort_key
      t.integer :cast_id
      t.timestamps
    end

    add_index :cast_transitions, :cast_id
    add_index :cast_transitions, %i{ sort_key cast_id }, unique: true
  end
end
