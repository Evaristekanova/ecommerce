class Api::V1::ProductsController < ApplicationController
    include Paginable
    before_action :check_login, only: [:create]
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :check_owner, only: [:update, :destroy]

    def index
        @products = Product.page(current_page).per(per_page).search(params)
        options = get_links_serializer_params('api_v1_products_path', @products)
        options[:include] = [:user]
        render json: ProductSerializer.new(@products, options).serializable_hash, status: :ok
    end

    def show
        @product = Product.find(params[:id])
        render json: ProductSerializer.new(@product).serializable_hash, status: :ok
    end

    def create
        @product = current_user.products.build(product_params)
        if @product.save
            render json: ProductSerializer.new(@product).serializable_hash, status: :created
        else
            render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            render json: ProductSerializer.new(@product).serializable_hash, status: :ok
        else
            render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
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
