class CreateRounds < ActiveRecord::Migration
  def up
   # drop_table 'rounds' if ActiveRecord::Base.connection.table_exists? 'rounds'

    #if ActiveRecord::Base.connection.table_exists? :rounds
     # drop_table :rounds
    #end
  end
  def change
    drop_table :rounds
    create_table :rounds do |t|
      t.string :character, :length => 1
      t.integer :points
      t.integer :round_count

      t.timestamps
    end
  end
end
