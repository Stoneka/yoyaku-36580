class ReservesController < ApplicationController
  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.valid?
     @reserve.save
     return redirect_to root_path
    else
      render "items/show"
    end
  end

  private
  
  #def reserve_params
  #  params.require(:reserve).permit(
  #    :quantity, :message, :honorific, :use_case).merge(
  #      customer_id: current_customer.id, item_id: @item.id,
  #       cart_id: current_customer.cart
  #    )
  #end

  def set_item
    @item = Item.find(params[:id])
  end

end
