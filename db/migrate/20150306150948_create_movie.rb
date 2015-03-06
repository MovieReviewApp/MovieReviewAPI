class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :gross, default: 0
      t.date :release_date
      t.string :mpaa_rating
      t.text :description
      t.timestamps
    end
  end
end
