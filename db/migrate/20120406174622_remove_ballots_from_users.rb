class RemoveBallotsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :ballots
      end

  def down
    add_column :users, :ballots, :text
  end
end
