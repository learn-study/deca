class Enforcement < ApplicationRecord
  paginates_per 50
  has_many :officers
  has_many :meals
  accepts_nested_attributes_for :meals, allow_destroy: true
end
