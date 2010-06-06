class TweetsController < ApplicationController
  before_filter :authenticate, :except => :refresh
  
  def index
    @tweets = Tweet.paginate :per_page => G140[:tweets_per_page], :page => params[:page]

    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def my
    @tweets = current_user.tweets.paginate :per_page => G140[:my_tweets_per_page], :page => params[:page]
  end

  def create
    content = params[:tweet]
    current_user.client.update(content)

    respond_to do |format|
      format.js
    end
  end

  def refresh
    @param = params[:category_id]
    if  @param == "fail"
      unless fragment_exist? "tweets_#{@param}"
        @tweets = Tweet.find(:all, :conditions => ["text like ?", "%#{G140[:today_topic]}%"], :order => 'original_tweet_id DESC', :limit => 8, :include => :user)
      end
    else
      unless fragment_exist? "tweets_#{@param}"
        @category = Category.find(params[:category_id])
        @tweets = @category.tweets.find :all, :limit => G140[:tweets_per_category], :order => "tweets.original_tweet_id DESC", :include => :user
      end
    end

    respond_to do |format|
      format.js { render :layout => false}
    end
  end

end
