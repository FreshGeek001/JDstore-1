class SearchController < ApplicationController
  def index
    @products = Product.all
    @products = Product.search(params[:search])
  end

  def show
    @product = Product.find(params[:id])
  end
end
