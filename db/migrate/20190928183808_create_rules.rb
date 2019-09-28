class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.integer :value
      t.references :award_entity, foreign_key: true

      t.timestamps
    end
  end
end
