class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.float :weight
      t.text :storie

      t.timestamps
    end
  end
end
