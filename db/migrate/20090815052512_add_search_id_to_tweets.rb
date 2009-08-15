class AddSearchIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :search_id, :integer
  end

  def self.down
    remove_column :tweets, :search_id
  end
end
