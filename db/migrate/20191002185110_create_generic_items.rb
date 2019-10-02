class CreateGenericItems < ActiveRecord::Migration[5.2]
  def change
    create_table :generic_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
