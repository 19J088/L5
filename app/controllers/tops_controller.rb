class TopsController < ApplicationController
 def main
        @tweet = Tweet.all
        render 'main'
    end
    
   def login
   
        if User.find_by(uid: params[:uid])
            if BCrypt::Password.new(User.find_by(uid: params[:uid]).pass) == params[:pass]
                session[:login_uid]=params[:uid]
                redirect_to root_path
            end
        else 
            render 'login'
        end
    end

   def logout
       session.delete(:login_uid)
       redirect_to root_path
   end
   end

