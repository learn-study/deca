class Ledger < ApplicationRecord
  paginates_per 50
  has_many :costs
  has_many :earnings
end
