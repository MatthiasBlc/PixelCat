class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def create
    puts '$' * 60
    puts params
    puts '$' * 60
    @item = Item.find(params[:item_id])
    @cart = Cart.create(user_id: current_user.id, item_id: @item.id)

    puts '$' * 60
    puts @item.id
    puts '$' * 60

    puts '$' * 60
    puts current_user.id
    puts '$' * 60

    # if @cart.save
    #   redirect_back(fallback_location: root_path)
    #   flash.now[:alert] = 'Le produit a bien été ajouté à votre panier.'
    # else
    #   flash.now[:alert] = @cart.errors.full_messages
    #   render 'new'
    # end

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
