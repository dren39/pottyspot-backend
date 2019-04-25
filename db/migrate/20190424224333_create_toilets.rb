class CreateToilets < ActiveRecord::Migration[5.2]
  def change
    create_table :toilets do |t|
      t.integer :api_id
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.text :directions
      t.text :comments
      t.integer :lat
      t.integer :long
      t.integer :distance
      t.string :password
      t.boolean :purchase

      t.timestamps
    end
  end
end
