class OrdersController < ApplicationController
  def new
    @order_request = OrderRequest.new
  end
  def create
    @order_request = OrderRequest.new(order_request_params)
    if @order_request.valid?
      #pay_item
      @order_request.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_request_params
    params.require(:order_request).permit(
      :visit_date, :visit_time_id).merge(
      reserve_id: params[:reserve_id],token: params[:token])
  end
  
  #def pay_item
  #  Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
  #  Payjp::Charge.create(
  #    amount: @item.price,
  #    card: order_shipping_params[:token],
  #    currency: 'jpy'
  #  )
  #end
end
