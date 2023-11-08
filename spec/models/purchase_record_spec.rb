# require 'rails_helper'

# RSpec.describe PurchaseRecord, type: :model do
#   before do
#     @purchase_record = FactoryBot.build(:purchase_record)
#   end

#   context '内容に問題ない場合' do
#     it "priceとtokenがあれば保存ができること" do
#       expect(@purchase_record).to be_valid
#     end
#   end

#   context '内容に問題がある場合' do
#     it "priceが空では保存ができないこと" do
#       @purchase_record.price = nil
#       @purchase_record.valid?
#       expect(@purchase_record.errors.full_messages).to include("Price can't be blank")
#     end

#     it "tokenが空では登録できないこと" do
#       @purchase_record.token = nil
#       @purchase_record.valid?
#       expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
#     end
# end
# end