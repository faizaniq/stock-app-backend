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
        @user = User.create(
            name: params[:name],
            username: params[:username],
            password: params[:password],
            funds: 0,
            original_funds: 0
        )

        if @user.valid?
            @token = encode_token(@user.id) 
            render json: {user: UserSerializer.new(@user), token: @token}, 
            status: :created  
        else      
            render json: {error: 'Failed to Create User'}, status:
            :not_acceptable  
        end  
    end

    def update
        @user = User.find(params[:id])
        @user.update(funds: params[:funds], original_funds: params[:original_funds])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

end
