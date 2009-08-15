class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :status
      t.integer :user_id, :artist_id, :twitter_id
      t.datetime :posted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
