class WelcomeController < ApplicationController
  def index
    @products = Product.all
    @products = Product.search(params[:search])
  end
end
