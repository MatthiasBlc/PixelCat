class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @total_price = total_cart_price
  end

  def create
    @order = Order.create

    @cartlist = params[:cartlist]
    @user = current_user
    @stripe_amount = @total_price

    begin
      @stripe_amount = 0
      current_user.carts.each do |cart_item|
        @stripe_amount += cart_item.item.price
      end

      customer = Stripe::Customer.create({
                                           email: params[:stripeEmail],
                                           source: params[:stripeToken]
                                         })

      charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: (@stripe_amount * 100).to_i,
                                       description: 'Achat sur la plateforme PixelCat',
                                       currency: 'eur'
                                     })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end

    @order = Order.create(id_stripe: customer.id,
                          user: @user,
                          date: DateTime.now,
                          total_price: @stripe_amount,
                          id_user: @user.id)

    if @order.save

      # add cart in jointable customer.id
      create_in_order

      # clear cart
      empty_cart

      redirect_to root_path

    else
      flash.now[:alert] = @order.errors.full_messages
      render 'new'
    end
  end

  def show 
    @order = Order.find(params[:id])
    @items = @order.items
  end

  private

  def create_in_order
    current_user.carts.each do |cart_item|
      OrderItem.create(order_id: @order.id, item_id: cart_item.item.id)
    end
  end

  def empty_cart
    current_user.carts.each do |cart_item|
      cart_item.destroy
    end
  end

  def total_cart_price
    @total_price = 0
    current_user.carts.each do |cart_item|
      @total_price += cart_item.item.price
    end
    @total_price
  end
end
