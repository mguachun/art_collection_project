class CollectionsController < ApplicationController
    #get all collections - READ
    get "/collections" do
        if !logged_in?
            redirect '/login'
        end
        @collections = current_user.collections
        erb :index
    end

    #view form to CREATE a collection
    get '/collections/new' do 
        if !logged_in? 
            redirect '/login'  
        end
        erb :"collections/new"
    end

    #get a collection READ
    get '/collections/:id' do
        redirect_if_not_logged_in
        @collection = Collection.find(params["id"])
        erb :"collections/show"
    end

    #CREATE a new collection item
    post "/collections" do 
        redirect_if_not_logged_in
        collection = current_user.collections.build(params)
        #collection = Collection.new(params)
        #collection.user = current_user
        #collection_user.collections << collection
        collection.save
        redirect "/collections/#{collection.id}" #makes a new GET request
    end

    #view the form to UPDATE a particular gallery
    get "/collections/:id/edit" do
        @collection = Collection.find(params[:id])
        redirect_if_not_authorized
        erb:"collections/edit"
    end

    #UPDATE a collection based on the edit form
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


