class AddLevelToUser < ActiveRecord::Migration
  def up
    add_reference :users, :level
  end

  def down
    remove_reference :users, :level
  end
end
