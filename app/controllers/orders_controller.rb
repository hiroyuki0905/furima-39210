class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id && @item.order.nil?
      @order_form = OrderForm.new
    else
      redirect_to root_path
    end
  end


  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, locals: { item: @item, order_form: @order_form }
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number)
  end

end