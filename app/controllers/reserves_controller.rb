class ReservesController < ApplicationController
before_action :set_item, only: [:create]
  def create
    @reserve = CartReserve.new(reserve_params)
    if @reserve.valid?
     @reserve.save
     return redirect_to root_path
    else
      render "items/show"
    end
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
