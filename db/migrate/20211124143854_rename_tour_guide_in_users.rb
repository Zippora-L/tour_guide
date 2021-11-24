class RenameTourGuideInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :tour_guide?, :tour_guide
  end
end
