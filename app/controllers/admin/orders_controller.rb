class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
    :total_payment, :payment_method, :status)
  end
end
