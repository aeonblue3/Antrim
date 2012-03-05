class AddCountToAnswer < ActiveRecord::Migration
  def change
  	add_column "answers", "count", :integer, :null => false, :default => 0
  end
end
