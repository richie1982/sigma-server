class UserProductsController < ApplicationController

    def delete_product
        user = current_user
        product = UserProduct.find_by(product_id: params[:product_id], user_id: user.id)
        if product
            product.destroy
            render json: product
        else
            render json: { error: "Not found" }, status: 404
        end
    end
end
