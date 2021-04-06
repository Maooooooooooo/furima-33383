class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  def index
    @items = Item.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
    end
  end
  private

  def item_params
    params.require(:article).permit(:item_name,:explanation,:category_id,:condition_id,:delivery_fee_id,:ship_from_area_id,:prefecture_id,:price,:image).merge(user_id: current_user.id)
  end
end
