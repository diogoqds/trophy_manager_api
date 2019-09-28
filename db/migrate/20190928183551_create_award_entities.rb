class CreateAwardEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :award_entities do |t|
      t.string :name
      t.references :entity, polymorphic: true

      t.timestamps
    end
  end
end
