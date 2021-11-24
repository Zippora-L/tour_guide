class AddBooleanToTours < ActiveRecord::Migration[6.0]
  def change
    change_column :tours, :status, :boolean, using: 'status::boolean'
  end
end
