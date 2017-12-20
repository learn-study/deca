class Remark < ApplicationRecord
  validates :date, presence: true
  validates :content, presence: true
end
