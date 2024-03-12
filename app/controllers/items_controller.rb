class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :sold_out_confirmation, only: [:edit]

  def index  
     @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 def show
  
 end

 def edit
  #  contributor_confirmation
  #  redirect_to root_path if current_user == @item.user
  #  sold_out_confirmation
 end

 def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end
 end

 def destroy
  if @item.destroy
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
 end

  private
  def item_params
    params.require(:item).permit(:image,:name, :explaination, :category_id, :condition_id,:del_fee_id,:prefecture_id,:days_until_shipping_id,:price,).merge(user_id: current_user.id)
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def sold_out_confirmation
    redirect_to root_path unless @item.not_sold_out?
  end
 end




;