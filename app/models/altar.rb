class Altar < ApplicationRecord
  has_many :altaritems
  accepts_nested_attributes_for :altaritems, allow_destroy: true

end
