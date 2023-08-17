class Api::V1::OrdersController < ApplicationController
    before_action :check_login

    def index
        render json: OrderSerializer.new(current_user.orders).serializable_hash, status: :ok
    end

    def show
        order = current_user.orders.find(params[:id])
        options = {include: [:products]}
        if order
            render json: OrderSerializer.new(order, options).serializable_hash, status: :ok
        else
            head(:not_found)
        end
    end

end
