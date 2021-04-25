class UsersController < ApplicationController
    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        user = User.new(email: params["email"], password: params["password"])
        if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
            redirect "/signup"
        else
            user.save
            session[:user_id] = user.id  #logs user in
            redirect "/login"
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
        redirect "/login"
    end
end
