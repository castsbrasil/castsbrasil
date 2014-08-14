class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, index: true

      t.timestamps
    end

    User.all.each do |u|
      u.create_profile
    end
  end

  def down
    drop_table :profiles
  end
end
