class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        user = User.new(
            name: params[:name],
            username: params[:username],
            password: params[:password],
            funds: params[:funds]
        )

        # if user.save
        #     token = encode_token(user.id)

        # render json: {user: UserSerializer.new(user), token: token}
        # else
        #     render json: {errors: user.errors.full_messages}
        # end
    end

    def update
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

end
