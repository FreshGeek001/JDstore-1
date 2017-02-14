class Admin::OrdersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order('id DESC')
  end

  def show
    @order = order.find(params[:id])
    @product_lists = @ordr.product_lists
  end
end
