class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index  # indexアクションを定義した
  end
  
end
