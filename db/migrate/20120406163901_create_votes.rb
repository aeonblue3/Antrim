class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :ballot_id
      t.datetime :vote_date

      t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, :ballot_id
  end
end
