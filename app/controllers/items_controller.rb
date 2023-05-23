class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index  
    @items = Item.includes(:images).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
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
      :postage_type_id,
      :price,
      images_attributes: [:id, :image] 
    )
  end
end