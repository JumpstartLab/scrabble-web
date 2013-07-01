class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.integer :score

      t.timestamps
    end
  end
end
