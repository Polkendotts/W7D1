require 'securerandom'

class User < ApplicationRecord

    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true 
    validates :password , length: {minimum: 6 , allow: true }
    after_initialize :ensure_session_token
    

    def reset_session_token!
        SecureRandom.base64(10)
    end 

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end 

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end 

    def self.find_by_credentials(user_name, password)
        user = User.find_by(username: username)
         
        if user && user.is_password?
            return user
        else
            nil
        end 

    end 

    
end
