class PurchasesController < ApplicationController
  def index
    @purchase = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:address_number, :region_id, :city, :street_number, :building_name, :phone_number, 
                                          :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
