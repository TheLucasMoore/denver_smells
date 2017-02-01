class AddNeighborhoodsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :neighborhood_id, :integer
  end
end
