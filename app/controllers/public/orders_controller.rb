class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end
  
  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = @customer.id
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800
    @total_payment = 0
    @order.total_payment = 0
    if params[:order][:address_option] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.full_name
      render 'confirm'
    elsif params[:order][:address_option] == "1"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
      render 'confirm'
    else
      @order.postal_code = Order.new(order_params).postal_code
      @order.address = Order.new(order_params).address
      @order.name = Order.new(order_params).name
      render 'confirm'
    end
  end
  
  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = @customer.id
    @order.save
    render "complete"
  end
  
  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
    :total_payment, :payment_method, :status)
  end
end
