class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.integer :zip
      t.string :state

      t.timestamps
    end
  end
end
