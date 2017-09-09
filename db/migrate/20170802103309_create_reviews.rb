class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description, null: false
      t.integer :rating, null: false
      t.integer :author_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
