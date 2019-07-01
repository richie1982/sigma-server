class UsersController < ApplicationController

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, include: [:user_products, :products]
        else
            render json: { error: "User not found" }, status: 404
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: { first_name: user.first_name, token: issue_token({ id: user.id }) }
        else
            render json: { errors: user.errors.full_messages }, status: 404
        end
    end

    def log_in 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: { first_name: user.first_name, email: user.email, token: issue_token({ id: user.id })}
        else
            render json: { error: "Invalid Username or Password"}, status: 401
        end
    end

    def validate
        user = current_user
        if user
            render json: {first_name: user.first_name, email: user.email, token: issue_token({ id: user.id })}
        else
            render json: { error: "Invalid token"}, status: 400
        end
    end

    def inventory
        user = current_user
        if user
            render json: user.products, except: [ :updated_at, :created_at]
        else
            render json: { error: "Invalid token"}, status: 400
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password)
    end

end
