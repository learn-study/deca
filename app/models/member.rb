class Member < ApplicationRecord

  before_validation {
      self.postal.tr!('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
      self.postal.tr!('－', '-')
      self.postal.delete!("-")
  }
  validates :lastname, presence: true, length: { in: 2..50 }
  validates :firstname, presence: true, length: { in: 2..50 }
  enum gender: {男性:1, 女性:2}
  

end
