class ChangeTwitterIdToString < ActiveRecord::Migration
  def self.up
    change_column :tweets, :twitter_id, :string
  end

  def self.down
    change_column :tweets, :twitter_id, :integer
  end
end
