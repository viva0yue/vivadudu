class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :tags
      t.string :cover_photo
      t.text :description
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
