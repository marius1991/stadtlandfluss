class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :solution
      t.string :category
      t.boolean :is_correct

      t.timestamps
    end
  end
end
