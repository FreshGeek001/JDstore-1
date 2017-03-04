class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.search(params[:search])
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @posts = @product.posts
    @prints = @product.prints.all
  end

  def road
    @products = Product.where(categories: '公路车')
    # @products = Product.all
  end

  def mountain
    @products = Product.where(categories: '山地车')
    # @products = Product.all
  end

  def bmx
    @products = Product.where(categories: 'BMX')
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将#{@product.title}加入购物车"
    else
      flash[:warning] = '你的购物车已有此物品'
  end
    redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    current_user.favorite_products << @product
    redirect_to :back
   end

  def unfavorite
    @product = Product.find(params[:id])
    current_user.favorite_products.delete(@product)
    redirect_to :back
  end
end
