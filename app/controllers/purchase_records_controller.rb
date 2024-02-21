class PurchaseRecordsController < ApplicationController
  # before_action :contributor_confirmation, only: [:index]
    before_action :set_item, only: [:index, :create]
    # before_action :contributor_confirmation, only: [:index]
    before_action :contributor_confirmation2, only: [:index]
    before_action :sold_out_confirmation, only: [:index]
    before_action :authenticate_user!, only: [:index]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @form_object = FormObject.new # ←新しくインスタンスを生成するnewメソッド
    
  end

  # def new
  #   @form_object = Formobject.new
  # end

  def create
    @form_object = FormObject.new(purchase_record_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:form_object).permit(:zip,:prefecture_id,:city,:street,:building,:phone).merge(user_id:current_user.id,item_id:@item.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,# purchase_record_params#[:price],  # 商品の値段
        card: purchase_record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      # orderテーブルにはpriceないので、上記記述ではpriceが取得できないはず itemテーブルから引っ張る
      )
    end
  


  # def contributor_confirmation
  #   redirect_to root_path unless current_user == @item.user
  # end

  

  def contributor_confirmation2
    redirect_to root_path if current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_confirmation
    redirect_to root_path unless @item.not_sold_out?
  end



  # def contributor_confirmation2
  #   if current_user != @item&.user
  #     flash[:alert] = "自身が出品した商品の商品購入ページにはアクセスできません"
  #     redirect_to root_path
  #   end
  # end

  # def contributor_confirmation
  #   @item = Item.find(params[:item_id])
  #   unless current_user == @item.user
  #     flash[:alert] = "自身が出品した商品の商品購入ページにはアクセスできません"
  #     redirect_to root_path
  #   end
  # end
end














