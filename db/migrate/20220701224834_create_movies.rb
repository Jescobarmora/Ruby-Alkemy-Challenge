class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.datetime :releasing_date
      t.integer :rating

      t.timestamps
    end
  end
end
