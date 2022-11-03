class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  private
  def customers_params
    params.require(:item).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
