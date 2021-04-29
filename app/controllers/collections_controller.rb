class CollectionsController < ApplicationController

    get "/collections" do
        if !logged_in?
            redirect '/login'
        end
        @collections = current_user.collections
        erb :index
    end

    get '/collections/new' do 
        if !logged_in? 
            redirect '/login'  
        end
        erb :"collections/new"
    end

    post "/collections" do 
        redirect_if_not_logged_in
        collection = current_user.collections.build(params)
        #collection = Collection.new(params)
        #collection.user = current_user
        #collection_user.collections << collection
        collection.save
        redirect "/collections/#{collection.id}" #makes a new GET request
    end

    get '/collections/:id' do
        redirect_if_not_logged_in
        @collection = Collection.find(params["id"])
        erb :"collections/show"
    end

    get "/collections/:id/edit" do
        @collection = Collection.find(params[:id])
        redirect_if_not_authorized
        erb:"collections/edit"
    end

    patch "/collections/:id" do 
        @collection = Collection.find(params["id"])
        redirect_if_not_authorized
        @collection.update(params["collection"])
        redirect "/collections/#{@collection.id}"
    end

    delete "/collections/:id" do
        @collection = Collection.find(params["id"])
        redirect_if_not_authorized
        @collection.destroy
        redirect "/collections"
    end



    private 
    def redirect_if_not_authorized
        if @collection.user != current_user
            redirect "/login"
        end
    end

end


