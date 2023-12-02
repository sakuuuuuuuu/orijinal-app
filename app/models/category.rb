class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '普通車' },
    { id: 3, name: '軽自動車' },
    { id: 4, name: 'コンパクトカー' },
    { id: 5, name: 'ワンボックス' },
    # { id: 6, name: '小物' },
    { id: 6, name: 'キャンピングカー' },
    { id: 7, name: '原付' },
    { id: 8, name: '普通自動二輪' },
    { id: 11, name: 'その他' },
  ]





include ActiveHash::Associations
  has_many :items


end

