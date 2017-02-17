class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|

      t.string :entry_code
      t.string :category
      t.string :entry_name
      t.string :entrant_name
      t.string :entrant_company
      t.integer :vote_count, default: 0

      t.timestamps null: false
    end
  end
end
