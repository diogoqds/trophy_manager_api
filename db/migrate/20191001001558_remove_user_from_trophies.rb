class RemoveUserFromTrophies < ActiveRecord::Migration[5.2]
  def change
    remove_column :trophies, :user_id
  end
end
