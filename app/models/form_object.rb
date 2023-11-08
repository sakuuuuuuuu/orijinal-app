class FormObject
  include ActiveModel::Model
   attr_accessor :item_id,:user_id,:zip,:prefecture_id,:city,:street,:building,:phone ,:token # hoge,:fuga...


    # validates :item,presence: true
    # validates :user,presence: true

    

    validates :zip,presence: true,format: { with: /\A\d{3}-\d{4}\z/, message: "は正しい形式で入力してください" }
    validates :prefecture_id,numericality: {other_than: 1, message: "can't be blank"}
    validates :city,presence: true
    validates :street,presence: true   
    # validates :building
    validates :phone,presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }

    #validates :purchase_record,presence: true
    validates :user_id,presence: true
    validates :item_id,presence: true
    validates :token,presence: true

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(user_id: user_id,item_id:item_id)
    Shipping.create(zip:zip,prefecture_id:prefecture_id,city:city,street:street,building:building,phone:phone,purchase_record_id:purchase_record.id)

  end
end