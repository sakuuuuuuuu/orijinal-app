class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  # , class_name: 'Category'
  belongs_to :condition
  # , class_name: 'Condition'
  belongs_to :del_fee
  belongs_to :prefecture
  # , class_name: 'Prefecture'
  belongs_to :days_until_shipping


  has_one :purchase_record # 商品購入機能実装で復活させる
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explaination, presence: true
  validates :price, presence:true

  # validates :price, format: { with: /\A[0-9]+\z/, message: "Price is not a number" }
  # 上記記述は下記validates :price, numericality〜の記述に含まれているため記述不要
  

  #下記の選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :del_fee_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :days_until_shipping_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}




  # validates :category_id, presence: true
  # validates :condition_id, presence: true
  # validates :del_fee_id, presence: true
  # validates :prefecture_id, presence: true
  # validates :days_until_shipping_id, presence: true
  # validates :price, presence: true { with: /\Az/}
  # validates :price, presence: true, format: { with: /\A\d+\z/ }

  # validates :user, presence: true
  
  def not_sold_out?
    purchase_record.nil?
  end
end
