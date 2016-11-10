class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :star
      t.text :content
      t.string :photo
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
