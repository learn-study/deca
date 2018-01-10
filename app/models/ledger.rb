class Ledger < ApplicationRecord
  paginates_per 50
  has_many :costs
  accepts_nested_attributes_for :costs, allow_destroy: true
  has_many :earnings
  accepts_nested_attributes_for :earnings, allow_destroy: true
end
