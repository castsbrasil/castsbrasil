class AddMostRecentToCastTransitions < ActiveRecord::Migration
  def change
    add_column :cast_transitions, :most_recent, :boolean

    add_index(:cast_transitions,
              [:cast_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_order_transitions_parent_most_recent")
  end
end
