class OrdersController < ApplicationController
before_action :set_reserve, only: [:new,:create]

  def new
    @order_request = OrderRequest.new
  end
  def create
    @order_request = OrderRequest.new(order_request_params)
    if @order_request.valid?
      pay_item
      @order_request.save
    else
      render 'new'
    end
  end

  private

  def order_request_params
    params.require(:order_request).permit(
      :visit_date, :visit_time_id).merge(
      reserve_id: params[:reserf_id], token: params[:token]
    )
  end
  
  def set_reserve
    @reserve = Reserve.find(params[:reserf_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @reserve.item.price,
      card: order_request_params[:token],
      currency: 'jpy'
    )
  end
end
