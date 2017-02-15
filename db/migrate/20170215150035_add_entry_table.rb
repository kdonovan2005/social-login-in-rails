class AddEntryTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :company
      t.integer :entry_number
      t.integer :vote_count, default: 0
    end
  end
end
