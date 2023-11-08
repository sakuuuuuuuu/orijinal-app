class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchase_records

         validates :nickname, presence: true
         validates :name_last, presence: true ,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :name_first, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :name_last_kana, presence: true,format: { with: /\A[\p{katakana}ー]+\z/}
         validates :name_first_kana, presence: true,format: { with: /\A[\p{katakana}ー]+\z/}

         validates :birth_day, presence: true
         validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

end

          # email と  password はデバイスで生成されてるからバリデーション記述する必要なし
        # パスワードの６文字以上制限がデバイスの標準装備だが、大文字小文字入力の制限の設置の記述必要
  
