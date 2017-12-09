class Family < ApplicationRecord
  before_validation {
      #郵便番号のハイフンを削除
      trim(self.postal)
  }
  include RankedModel
  ranks :row_order
  enum separately: {同居:1, 別居:0}
  validates :lastname, presence: true, length: { in: 2..50 }
  validates :firstname, presence: true, length: { in: 2..50 }
  belongs_to :member
end
