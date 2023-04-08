class User < ApplicationRecord
    has_secure_password
    has_many :efforts
    validates :username, uniqueness: true
end
