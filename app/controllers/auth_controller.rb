class AuthController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
        token = encode_token(user.id)

        render json: {user: UserSerializer.new(user), token: token}
        else
        render json: {errors: "Please try again!"}
        end
    end

    def auto_login
        if curr_user
        render json: curr_user
        else
        render json: {errors: "Please login!"}
        end
    end


end
