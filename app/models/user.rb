class User < ApplicationRecord
    has_many :transactions
    has_many :stocks, through: :transactions
    has_many :watchlists
    has_secure_password


































    
end
