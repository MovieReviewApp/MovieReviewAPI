class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star_rating
      t.string :username, default: "anonymous"
      t.belongs_to :movie, index: true
      t.timestamps
    end
    add_foreign_key :reviews, :movies
  end
end
