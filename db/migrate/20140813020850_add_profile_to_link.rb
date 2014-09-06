class AddProfileToLink < ActiveRecord::Migration
  def change
    add_reference :links, :profile, index: true
  end
end
