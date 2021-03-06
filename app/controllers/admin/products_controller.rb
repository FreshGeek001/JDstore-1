class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin'
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @photo = @product.photos.build # for multi-pics
    @print = @product.prints.build # for multi-pics
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      unless params[:photos].nil?
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(avatar: a)
        end
     end
      unless params[:prints].nil?
        params[:prints]['avatar'].each do |a|
          @print = @product.prints.create(avatar: a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    unless params[:photos].nil?
      @product.photos.destroy_all # need to destroy old pics first
      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(avatar: a)
      end
    end

    unless params[:prints].nil?
      @product.prints.destroy_all # need to destroy old pics first
      params[:prints]['avatar'].each do |a|
        @picture = @product.prints.create(avatar: a)
      end
    end

    @product.update(product_params)
    redirect_to admin_products_path
    end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
    end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :categories)
  end
end
