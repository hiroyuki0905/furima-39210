class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index  
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition_id,
      :prefecture_id,
      :delivery_fee_id,
      :delivery_day_id,
      :price,
    )
  end
end
