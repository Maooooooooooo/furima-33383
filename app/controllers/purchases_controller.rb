class PurchasesController < ApplicationController
  def index
    @purchase = PurchaseForm.new(set_params)
  end

  def create
    @purchase = PurchaseForm.new(set_params)
    if @purchase.valid?
      @purchase.save
    end
  end

  private
  def set_params
    params.permit(:purchase, :ship)
  end
end
