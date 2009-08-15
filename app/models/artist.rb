class Artist < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  
  has_many :tweets, :order => "posted_at DESC"
  has_many :users, :through => :tweets
  
  # TODO: only update permalink if the name has been changed
  def before_save
    self.permalink = name.downcase.gsub(/\s+/, "-").gsub(/[^a-zA-Z0-9_-]+/, "")
  end
  
  def to_param
    permalink
  end
end