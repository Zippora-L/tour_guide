class ChangePriceOnTours < ActiveRecord::Migration[6.0]
  def change
    change_column :tours, :price, :integer
  end
end
