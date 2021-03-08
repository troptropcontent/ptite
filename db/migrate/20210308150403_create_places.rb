class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :street_address
      t.integer :zip
      t.string :city
      t.string :country
      t.timestamps
    end
  end
end
