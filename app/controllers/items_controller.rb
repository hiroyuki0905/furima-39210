class ItemsController < ApplicationController
  # indexアクションを定義した
  def index  
  end

  def new
    @item = Item.new
  end
  
end