class Member < ApplicationRecord
  include RankedModel
  before_save :word_check
  
  ranks :row_order
  before_validation {
      #郵便番号のハイフンを削除
      trim(self.postal)
      trim(self.tel)
      trim(self.mobile)
  }
  enum gender: {男性:1, 女性:2}
  paginates_per 50  
  has_many :families
  has_many :relationships
  has_many :remarks
  has_many :member_relashionships, through: :relationships,source: :member2



  def word_check
    if self.city.include?("北海道")
      self.city.delete!("北海道")
    end
  end
end
