class CreateCollections < ActiveRecord::Migration[5.1]
    def change
        create_table :collections do |t|
            t.string :artist
            t.string :title
            t.integer :year 
            t.string :movement
            t.string :location
            t.string :medium
        end
    end
end
