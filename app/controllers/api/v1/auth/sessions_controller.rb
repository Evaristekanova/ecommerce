class Api::V1::Auth::SessionsController < ApplicationController
    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            render json: {status: "success", token: token, user: @user}, status: :ok
        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end

end
