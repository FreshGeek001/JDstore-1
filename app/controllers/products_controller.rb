class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :unfavorite]
  def index
    @products = Product.all
    @products = Product.search(params[:search])
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @posts = @product.posts
    @prints = @product.prints.all
    if @posts.blank?
      @avg_rating = 0
    else
      @avg_rating = @posts.average(:rating).round(2)
    end
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
    flash[:notice] = '您已收藏宝贝'
    redirect_to :back
   end

  def unfavorite
    @product = Product.find(params[:id])

    current_user.favorite_products.delete(@product)
    flash[:notice] = '您已取消收藏宝贝'
    redirect_to :back
  end
end
