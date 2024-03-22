class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:index, :new, :create]
  before_action :redirect_user, only: [:index, :new, :create]

  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
      pay_item
      @purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:address_number, :region_id, :city, :street_number, :building_name, :phone_number, 
                                          :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_user
    redirect_to root_path if @item.purchase.present? || current_user.id == @item.user_id
  end
end
