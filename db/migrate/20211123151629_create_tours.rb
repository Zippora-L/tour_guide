class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.integer :limit_of_people
      t.decimal :price
      t.time :starting_time
      t.integer :duration
      t.string :status
      t.string :destination

      t.timestamps
    end
  end
end
