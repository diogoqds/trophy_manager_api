class AddValueToGenericItemUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :generic_item_users, :value, :integer
  end
end
