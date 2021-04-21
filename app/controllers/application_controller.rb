require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'supersecretsession'
  end

  get "/" do
    "Welcome"
    erb :welcome
  end

  helpers do #allows views to access these methods
    def logged_in?
      !!current_user #returns boolean
    end

    def current_user #memoization
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      #if @current_user
      # @current_user
      #else
      # @current_user = User.find(params[:user_id])
      # end
    end

    private
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end


  end

end


 