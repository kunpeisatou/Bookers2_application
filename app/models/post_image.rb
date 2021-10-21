class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # ここを追加（_idは含めません）
  
  validates :shop_name, presence: true
  validates :image, presence: true
end
