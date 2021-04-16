class UsersController < ApplicationController

    #users are able to sign up
    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        u = User.new(email: params["email"], password: params["password"])
        if u.email.blank? || u.password.blank? || User.find_by_email(params["email"])
            redirect "/signup"
        else
            u.save
            session[:user_id] = u.id  #logs user in
            redirect "/collections" #redirects elsewhere
        end
    end

    get "/login" do #shows form
        erb :"users/login"
    end

    post "/login" do  #handles/processes form
         user = User.find_by_email(params[:email])
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/collections"
         else
            redirect "/login"
         end
    end

    get "/logout" do 
        session.clear #clears session
        redirect "/signup"
    end
end
