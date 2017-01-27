class AddCityToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :city_id, :integer
  end
end
