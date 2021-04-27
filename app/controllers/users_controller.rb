class UsersController < ApplicationController
    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        user = User.new(email: params["email"], password: params["password"])
        if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
            redirect "/signup" #login
        else
            user.save
            session[:user_id] = user.id 
            redirect "/login"
        end
    end

    get "/login" do 
        erb :"users/login"
    end

    post "/login" do  
         user = User.find_by_email(params[:email])
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/collections"
         else
            redirect "/login"
         end
    end

    get "users/:id" do 
        @user = User.find_by(id: params[:id])
        if user
            erb :"users/show"
        else
            redirect "/"
        end
    end



    get "/logout" do 
        session.clear 
        redirect "/login"
    end
end
