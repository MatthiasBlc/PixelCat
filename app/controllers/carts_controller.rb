class CartsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def create

    @item = Item.find(params[:item_id])
    @cart = Cart.create(user_id: current_user.id, item_id: @item.id)

    respond_to do |format|
      format.html { redirect_to carts_path, notice: 'Votre image a été ajouté au panier.' }
      format.js {}
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email was successfully destroyed." }
      format.js {}
    end
  end

end
