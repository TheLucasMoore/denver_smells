class CreateUserReports < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reports do |t|
      t.string :latitude
      t.string :longitude
      t.string :description
      t.integer :user_id
      t.float :smell_intensity

      t.timestamps
    end
  end
end
