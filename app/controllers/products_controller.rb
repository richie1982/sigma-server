class ProductsController < ApplicationController

    def create
        product = Product.find_or_create_by(track_params)
        if product
            user = User.find_by(email: params[:email])
            UserProduct.create(user_id: user.id, product_id: product.id)
            render json: product
        else 
            render json: { errors: product.errors.full_messages }, status: 404
        end
    end

    private

    def track_params
        params.permit(:name, :ticker)
    end

end
