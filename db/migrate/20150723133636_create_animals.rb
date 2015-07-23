class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type_of_animal
      t.string :race
      t.date :arrived_at
      t.text :description

      t.timestamps null: false
    end
  end
end
