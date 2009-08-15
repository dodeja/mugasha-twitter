class Search < ActiveRecord::Base
  has_many :tweets
  belongs_to :artist
  
  
end
