class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # indexアクションを定義した
  def index  
  end
  
end