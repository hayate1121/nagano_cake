class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    @order = Order.find(order_detail.order_id)
    @order_details = @order.order_details
    if @order_details.where(making_status: "completed").count == @order_details.count
      order_detail.order.update(status: "preparing")
    end
    redirect_to admin_order_path(order_detail.order.id)
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
