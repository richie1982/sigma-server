class ProductsController < ApplicationController

    def create
        product = Product.new(name, ticker)
        if product.save
            render json: { product }
        else 
            render json: { errors: product.errors.full_messages }, status: 404
        end
    end

end
