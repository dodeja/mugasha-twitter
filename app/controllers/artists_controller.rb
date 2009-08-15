class ArtistsController < ApplicationController
  before_filter :find_artist, :only => [:show, :edit, :destroy, :fetch_tweets]
  
  def index
    @artists = Artist.all.paginate :per_page => 50, :page => params[:page]
  end
  
  def show
    @tweets = @artist.tweets.paginate :per_page => 10, :page => params[:page]
  end
  
  def new
    @artist = Artist.new
  end
  
  def edit
  end
  
  def create
    @artist = Artist.new(params[:artist])
    
    if @artist.save
      redirect_to @artist
    else
      @artists = Artist.all
      render :action => "index"
    end
  end
  
  def update
    if @artist.update_attributes(params[:artist])
      flash[:notice] = "Artist \"#{@artist.name}\" was successfully updated"
      redirect_to @artist
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @artist.destroy
    flash[:notice] = "Artist \"#{@artist.name}\" was successfully deleted"
    redirect_to artists_path
  end
  
  def fetch_tweets
    search = Search.new(:artist_id => @artist.id)
    search.save
    
    grackle = Grackle::Client.new(:api => :search)    
    results = grackle.search.json(:q => "\"#{@artist.name}\"+-RT-via", :rpp => 100, :since_id => @artist.last_search_id).results
    
    for result in results
      unless user = User.find_by_twitter_id(result.from_user_id)
        user = User.new(:username => result.from_user, :twitter_id => result.from_user_id)
        user.save
      end
      tweet = Tweet.new(:artist_id => @artist.id, :user_id => user.id, :status => result.text, :twitter_id => result.id, :posted_at => result.created_at, :search_id => search.id)
      tweet.save
    end
    
    @artist.last_search_id = results.first.id
    @artist.save
    
    redirect_to @artist
  end
  
  private
  
  def find_artist
    @artist = Artist.find_by_permalink(params[:id]) if params[:id]
  rescue
    flash[:error] = "Artist #{params[:id]} could not be found"
    redirect_to :action => "index"
  end
end
