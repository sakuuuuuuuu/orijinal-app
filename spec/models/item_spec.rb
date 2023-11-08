require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品が投稿できる場合' do
      it 'すべてのカラムが存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が投稿できない場合' do
      it 'imageが空では投稿できない' do
        @item.image =nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explainationが空では登録できない' do
        @item.explaination = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explaination can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end     
      it 'del_fee_idが1では登録できない' do
        @item.del_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Del fee can't be blank"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'days_until_shipping_idが1では登録できない' do
        @item.days_until_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Days until shipping can't be blank"
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが299以下では登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
       it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが半角数値以外では登録できない' do
        @item.price = 'あA'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
  end
end
end