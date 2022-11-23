class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_details = order.order_details
    @total_amount = 0
  end
end
