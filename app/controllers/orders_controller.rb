class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Orders.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create

    # @event = Event.find(params[:event_id])
    @cartlist = params[:cartlist]
    @user = current_user
    @stripe_amount = params[:total_price]

    # puts "*"*50

    # puts "*"*50

    @order = Order.create(id_stripe: 123,
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

  private

 
  def empty_cart
    current_user.carts.each do |item|
      item.destroy
    end
  end

  def create_in_order
    current_user.carts.each do |item|
      OrderItem.create(user_id: current_user.id, item_id: item.id)
    end
  end
end
