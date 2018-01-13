class Report < ApplicationRecord
  has_many :deliverables
  accepts_nested_attributes_for :deliverables, allow_destroy: true
end
