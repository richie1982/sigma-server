class User < ApplicationRecord
    has_many :user_products
    has_many :products, through: :user_products
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password, length: { minimum: 5, maximum: 20 }

end
