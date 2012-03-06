class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :key
      t.text :ballots

      t.timestamps
    end
  end
end
