class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "confirm"
      order.order_details.update_all(making_status: "wait")
    end
    redirect_to admin_order_path(order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
    :total_payment, :payment_method, :status)
  end
end
