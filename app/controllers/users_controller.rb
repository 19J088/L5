class UsersController < ApplicationController
def index
    @user = User.all
end

def new
      @user = User.new
end

def create
    @user = User.new(uid: params[:uid], pass:BCrypt::Password.create(params[:pass]))
    if @user.save
         flash[:notice] = '登録しました'
    redirect_to root_path
    else
      render 'new'
    end
end

def destroy
     user = User.find(params[:id])
    if user.destroy
      flash[:notice] = '削除しました'
    end
    redirect_to root_path
  end
end
