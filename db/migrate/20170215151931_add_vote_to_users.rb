class AddVoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vote, :boolean, default: true
  end
end
