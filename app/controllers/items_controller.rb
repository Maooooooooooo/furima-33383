class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit]
  before_action :set_item, only:[:edit,:show,:update]
  before_action :item_root, only:[:edit,:update,:destroy]
  def index
    @items = Item.all.order(created_at: :desc)
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

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:explanation,:category_id,:condition_id,:delivery_fee_id,:ship_from_area_id,:prefecture_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_root
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
