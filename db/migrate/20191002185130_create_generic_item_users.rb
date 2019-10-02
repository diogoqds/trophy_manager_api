class CreateGenericItemUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :generic_item_users do |t|
      t.references :user, foreign_key: true
      t.references :generic_item, foreign_key: true

      t.timestamps
    end
  end
end
