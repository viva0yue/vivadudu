class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_initial
      t.integer :user_id

      t.timestamps

    end
  end
end
