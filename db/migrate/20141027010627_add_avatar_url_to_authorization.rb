class AddAvatarUrlToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :avatar_url, :string
  end
end
