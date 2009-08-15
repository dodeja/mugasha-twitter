class Tweet < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  
  validates_uniqueness_of :twitter_id
end
