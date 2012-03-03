class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
