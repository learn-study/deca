class Member < ApplicationRecord
  include RankedModel
  ranks :row_order
  before_validation {
      #郵便番号のハイフンを削除
      trim(self.postal)
      trim(self.tel)
      trim(self.mobile)
  }
  validates :lastname, presence: true, length: { in: 2..50 }
  validates :firstname, presence: true, length: { in: 2..50 }
  enum gender: {男性:1, 女性:2}
  paginates_per 50  
  has_many :families
  has_many :relationships
  has_many :remarks
  has_many :member_relashionships, through: :relationships,source: :member2

end
