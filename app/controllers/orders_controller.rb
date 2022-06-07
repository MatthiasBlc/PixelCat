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




      # clear cart





      redirect_to root_path
      # redirect add cart in jointable customer.id


    else
      flash.now[:alert] = @order.errors.full_messages
      render 'new'
    end
  end
end
