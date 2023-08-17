class Api::V1::ProductsController < ApplicationController
    before_action :check_login, only: [:create]
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :check_owner, only: [:update, :destroy]

    def index
        @products = Product.all
        render json: {status: 'seccess', message: 'loaded products', data: @products}, status: :ok
    end

    def show
        @product = Product.find(params[:id])
        render json: {status: 'seccess', message: 'loaded product', data: @product}, status: :ok
    end

    def create
        @product = current_user.products.build(product_params)
        if @product.save
            render json: {status: 'seccess', message: 'created product', data: @product}, status: :created
        else
            render json: {status: 'error', message: 'product not created', data: @product.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            render json: {status: 'seccess', message: 'updated product', data: @product}, status: :ok
        else
            render json: {status: 'error', message: 'product not updated', data: @product.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
        head :no_content
    end

    private
    def product_params
        params.require(:product).permit(:tittle, :price, :published)
    end

    def set_product
        @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: {message: 'product not found'}, status: :not_found
    end

end
