class User < ActiveRecord::Base
    has_many :collections
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true

end
