class AddUsersToTours < ActiveRecord::Migration[6.0]
  def change
    add_reference :tours, :user, index: true
  end
end
