The GalleryProject
The GalleryProject is an app that allows a user to sign up and keep track of their own online gallery comprised of piece of art from around the world. 

Shotgun
Since it is not yet published, use shotgun to run this on your localhost.

Authentication
For password encryption and authentication, this pass uses BCrypt gem.

Database
For the database we are using ActiveRecord and SQLite3.

Models
The two models are collection and user. The collection contains the belongs_to relationship while the user contains the has_many relationship. The controllers are seperated by single responsibility. 

Controllers
The collection contains the belongs_to relationship while the user contains the has_many relationship. The controllers are seperated by single responsibility. The collections_controller contains the CRUD actions, the users_controller takes care of signing a user in or logging a user in/out, and the application controller is what is used when a request it made to delegates where the commands go/what they perform. 
Bcrypt handles the salt and password encryption for protecting a user's password and storing it. 

How to:
After cloning this app to your computer, run bundle install to download the appropriate gems to run this site. Gems needed for this site are found in the gemfile. Run shotgun to run this site on your local host so you can explore and operate the site. 
