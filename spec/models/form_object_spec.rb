require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @form_object = FactoryBot.build(:form_object, user_id: user.id, item_id: item.id)
    end

    
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@form_object).to be_valid
      end
      it '建物名がなくても保存できること' do
        @form_object.building = ''
        expect(@form_object).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipが空だと保存できないこと' do
        @form_object.zip = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Zip can't be blank")
      end
      it 'zipが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @form_object.zip = '1234567'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Zip は正しい形式で入力してください')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @form_object.prefecture_id ='1'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @form_object.city = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @form_object.street = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @form_object.phone = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁未満の場合は保存できないこと' do
        @form_object.phone = '123456789'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数字で入力してください")
      end
      it 'phoneが11桁を超える場合は保存できないこと' do
        @form_object.phone = '090123456789'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数字で入力してください")
      end
      it 'phoneがハイフンを含まない正しい形式でない場合は保存できないこと' do
        @form_object.phone = '090-1234-5678'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数字で入力してください")
      end
      

      it 'userが紐付いていないと保存できないこと' do
        @form_object.user_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @form_object.item_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがないと保存できないこと' do
        @form_object.token = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
