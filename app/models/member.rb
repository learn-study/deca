class Member < ApplicationRecord

  before_validation {
      #郵便番号のハイフンを削除
      trim(self.postal)
      trim(self.tel)
      trim(self.mobile)
  }
  validates :lastname, presence: true, length: { in: 2..50 }
  validates :firstname, presence: true, length: { in: 2..50 }
  enum gender: {男性:1, 女性:2}
  
  has_many :families

end
