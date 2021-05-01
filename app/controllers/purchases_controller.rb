class PurchasesController < ApplicationController
  before_action :authenticate_user!,only:[:index]
  before_action :set_purchase, only:[:index,:create]
  def index

    @purchase_form = PurchaseForm.new
    if current_user.id == @purchase.user_id || @purchase.purchase.present?
      return redirect_to root_path
    end
  end

  def create
    @purchase_form = PurchaseForm.new(set_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_params
    params.require(:purchase_form).permit(:postal_cord, :prefecture_id, :city, :word, :building, :phone_number).merge(user_id:current_user.id,token:params[:token],item_id:params[:item_id])
  end

  def set_purchase
    @purchase = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @purchase.price,
        card: set_params[:token],
        currency: 'jpy'
      )
  end
end
