class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :character
      t.string :city
      t.string :country
      t.string :river
      t.integer :points

      t.timestamps
    end
  end
end
