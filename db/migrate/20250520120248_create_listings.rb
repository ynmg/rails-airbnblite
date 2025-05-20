class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :location
      t.string :name
      t.text :description
      t.float :price
      t.integer :number_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
