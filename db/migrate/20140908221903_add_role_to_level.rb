class AddRoleToLevel < ActiveRecord::Migration
  def up
    add_reference :levels, :role
  end

  def down
    remove_reference :levels, :role
  end
end
