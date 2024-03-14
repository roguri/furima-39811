class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_number, :region_id, :city, :street_number, :building_name, :phone_number, 
                                          :item_id, :user_id, :token)
  end
end
