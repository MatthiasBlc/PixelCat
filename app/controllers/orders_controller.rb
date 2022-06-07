class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Orders.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create()

  end
end
