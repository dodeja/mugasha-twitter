class User < ActiveRecord::Base
  has_many :tweets
  has_many :artists, :through => :tweets
  
  validates_uniqueness_of :username, :twitter_id
end
