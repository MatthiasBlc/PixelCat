class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
  end
end
