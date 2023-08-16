class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end


    def show
        render json: @user
    end

    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end


    private
    def user_params
        params.permit(:email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    rescue
        render json: {error: "User not found"}, status: :not_found
    end
end
