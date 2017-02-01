class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :zip
      t.integer :city_id
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
