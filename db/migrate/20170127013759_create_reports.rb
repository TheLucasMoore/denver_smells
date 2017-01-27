class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :wind_dir
      t.integer :wind_mph
      t.integer :wind_gust_mph
      t.string :wind_description
      t.integer :temperature
      t.string :description
      t.timestamps
    end
  end
end
