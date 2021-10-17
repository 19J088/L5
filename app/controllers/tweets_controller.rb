class TweetsController < ApplicationController
def index
    @tweet = Tweet.all 
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(message: params[:message])
    user = User.find_by(params[:id])
    @tweet.user_id = user.id
    if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      render 'new_tweet'
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:notice] = 'ツイートを削除しました'
    end
    redirect_to root_path
  end
 end