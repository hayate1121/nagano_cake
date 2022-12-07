class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    @order = Order.find(order_detail.order_id)
    @order_details = @order.order_details
    @order_details.each do |order_detail|
      if order_detail.making_status != "completed"
        return
      else
        order_detail.order.update(status: "preparing")
      end
    end
    redirect_to admin_order_path(order_detail.order.id)
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end
end
