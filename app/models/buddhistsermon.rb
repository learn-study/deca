class Buddhistsermon < ApplicationRecord
  has_many :memorialitems
  accepts_nested_attributes_for :memorialitems, allow_destroy: true
end
