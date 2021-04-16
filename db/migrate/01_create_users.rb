class CreateUsers < ActiveRecord::Migration[4.2]
    def change 
        create_table :users do |t|
            t.string :gallery_owner
            t.string :email
            t.string :password_digest
        end
    end
end
