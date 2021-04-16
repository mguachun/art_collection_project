class CollectionsController < ApplicationController
    #get all collections - READ
    get "/collections" do
        @collections = Collection.all 
        erb :index
    end

    #view form to CREATE a collection
    get '/collections/new' do 
        # display the new view 
        if !logged_in? 
            redirect '/login'  #leave the method 
        end
        erb :"collections/new"
    end

    #get a collection READ
    get '/collections/:id' do
        redirect_if_not_logged_in
        @collection = Collection.find(params["id"])
        erb :"collections/show"
        #displays show view
    end

    #CREATE a new collection
    post "/collections" do 
        redirect_if_not_logged_in
        collection = current_user.collections.build(params)
        #collection = Collection.new(params)
        #collection.user = current_user
        #collection.user_id = session[:user_id]
        #collection_user.collections << collection
        collection.save
        redirect "/collections" #makes a new GET request
    end

    #view the form to UPDATE a particular gallery
    get "/collections/:id/edit" do
        @collection = Collection.find(params["id"])
        redirect_if_not_authorized
        erb:"collections/edit"
    end

    #UPDATE a collection based on the edit form
    put "/collections/:id" do 
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
            redirect "/collections"
        end
    end

end
