class AddPicturesToAnimals < ActiveRecord::Migration
  def change
    change_column :animals, :pictures, :string
  end
end
