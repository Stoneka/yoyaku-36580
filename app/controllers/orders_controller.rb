class OrdersController < ApplicationController
  def new
    @order_request = OrderRequest.new
  end
end
