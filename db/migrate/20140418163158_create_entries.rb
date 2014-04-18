class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.text :instructions

      t.timestamps
    end
  end
end
