require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
    it 'ユーザー新規登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'お名前が空では登録できない' do
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name last can't be blank"
    end
    it 'お名前が半角では登録できない' do
      @user.name_last = '0000test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name last is invalid"
    end
    it 'お名前が空では登録できない' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name first can't be blank"
    end
    it 'お名前が半角では登録できない' do
      @user.name_first = '0000test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name first is invalid"
    end
    it 'お名前が空では登録できない' do
      @user.name_first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name first kana can't be blank"
    end
    it 'お名前が半角では登録できない' do
      @user.name_first_kana = '00000test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name first kana is invalid"
    end
    it 'お名前が空では登録できない' do
      @user.name_last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name last kana can't be blank"
  end
  it 'お名前が半角では登録できない' do
    @user.name_last_kana = '00000test'
    @user.valid?
    expect(@user.errors.full_messages).to include "Name last kana is invalid"
end
  it '誕生日が空では登録できない' do
    @user.birth_day = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Birth day can't be blank"
  end
  it 'passwordが5文字以では登録できない' do
    @user.password = '0000a'
    @user.password_confirmation = @user.password 
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
  end
  it 'passwordが英字と数字両方含めなければでは登録できない' do
    @user.password = '00000000'
    @user.password_confirmation = @user.password 
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
  end
  it 'passwordが英字と数字両方含めなければでは登録できない' do
    @user.password = 'aaaaaaaaa'
    @user.password_confirmation = @user.password 
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
  end
  it 'passwordが英字と数字、以外の値が入ると登録できない' do
    @user.password = 'あああああああ'
    @user.password_confirmation = @user.password 
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
  end
  
  it 'passwordが確認と一致しないと登録できない' do
    @user.password = '000000000a'
    @user.password_confirmation = '0000000000b'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end
  it 'emailが@がないと登録できない' do
    @user.email = 'aaaaaaaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include "Email is invalid"
  end
  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
end
end
end