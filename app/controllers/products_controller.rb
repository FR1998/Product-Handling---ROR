class ProductsController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]


  def index
      @products = current_user.products
  end

  def show
      @product = Product.find(params[:id])
    end
  
    def new
     @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      @product.user_id = current_user.id
        if @product.save
          redirect_to products_path
        else
          render :new
        end
    end
  
    def edit
        @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
        if @product.update(product_params)
          redirect_to products_path
        else
          render :edit
        end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end
  
    private

    def set_user
      @product = Product.find(params[:id])
    end

      def product_params
        params.require(:product).permit(:product_name, :quantity, :price)
      end
  end