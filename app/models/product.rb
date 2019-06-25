class Product < ApplicationRecord
    has_many :user_products
    has_many :users, through: :user_products

    validates :ticker, uniqueness: true
    validates :ticker, presence: true
end
