require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'supersecretsession'
  end

  get "/" do
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def find_user
      @user = User.find_by_email(params[:email])
    end

    def redirect_if_logged_in
      if logged_in?
        # flash[:errors] = ["Stop! You are already logged in!"]
        redirect "/"
      end
    end

    def redirect_if_not_logged_in
      unless logged_in?
        # flash[:errors] = ["Please log in to have access to this page!"]
        redirect "/login"
      end
    end
  end
end







 