class Family < ApplicationRecord
  before_validation {
      #郵便番号のハイフンを削除
      trim(self.postal)
  }
  include RankedModel
  ranks :row_order
  enum separately: {同居:1, 別居:0}
end
