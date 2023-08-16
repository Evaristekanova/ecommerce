class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: {status: "success", data: @users}, status: :ok
    end


    def show
        render json: {status: "success", data: @user}, status: :ok
    end


    def create
        @user = User.new(user_params)
        if @user.save
            render json: {status: "success", data: @user}, status: :created
        else
            render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render json: {status: "success", data: @user}, status: :ok
        else
            render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        render json: {status: "success", data: @user}, status: :ok

    private
    
    def user_params
        params.permit(:email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    rescue
        render json: {message: "User not found"}, status: :not_found
    end
end
