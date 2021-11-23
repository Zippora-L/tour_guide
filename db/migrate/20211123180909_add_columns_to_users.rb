class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :varchar
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :tour_guide?, :boolean
    add_column :users, :bio, :text
  end

end
