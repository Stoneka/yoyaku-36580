class CartsController < ApplicationController
  before_action :set_cart , only: :show
  def show
    @reserves = Reserve.where(cart_id: @cart.id)
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
