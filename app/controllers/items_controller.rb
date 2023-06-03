class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user_ownership, only: [:edit, :update, :destroy]

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
    @items = Item.where.not(user_id: nil).order('created_at DESC')
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user_ownership
    if user_signed_in? && @item.user_id != current_user.id
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to new_user_session_path
    end
  end

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
