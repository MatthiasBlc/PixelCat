class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    # Ici prévoir d'enregistrer la commande en base 
    @stripe_amount = 500
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat sur la plateforme PixelCat",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    # Ici prévoir le delete le panier 
  end

end
