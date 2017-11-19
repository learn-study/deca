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
  has_many :relations, class_name: "Relationship",foreign_key: "user_id"
  has_many :member_relashionships, through: :relations,source: :member

end
