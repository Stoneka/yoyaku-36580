class ReservesController < ApplicationController
  before_action :authenticate_customer!, only: [:create, :destroy, :manage]
  before_action :set_item, only: [:create]
  def create
    @reserve = CartReserve.new(reserve_params)
    if @reserve.valid?
     @reserve.save
     @cart = Cart.find_by(customer_id: @reserve.customer_id)
     redirect_to cart_path(@cart.id)
    else
     render "items/show"
    end
  end

  def destroy
    @reserve_data = Reserve.find(params[:id])
    @cart_data = Cart.find_by(customer_id: @reserve_data.customer_id)
    @reserve_data.destroy
    redirect_to cart_path(@cart_data.id)
  end

  def manage
    unless current_customer.admin?
      redirect_to root_path
    end
    #お渡し日で並び替える前の記述メモ@reserves = Reserve.includes(:customer, :item, [order: :request])
    @reserves = Order.includes(:request, [reserve: :item], [reserve: :customer]).order("requests.visit_date ASC")
  end

  private
  
  def reserve_params
    params.require(:cart_reserve).permit(
      :quantity, :message, :honorific, :use_case).merge(
      customer_id: current_customer.id, item_id: @item.id
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
