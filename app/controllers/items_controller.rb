class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.where.not(user_id: nil).order("created_at DESC")
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
      :image
    ).merge(user_id: current_user.id)
  end
end
