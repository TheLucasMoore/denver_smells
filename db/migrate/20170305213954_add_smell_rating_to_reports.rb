class AddSmellRatingToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :smell_rating, :integer
  end
end
