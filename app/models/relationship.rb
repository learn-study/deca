class Relationship < ApplicationRecord
  belongs_to :member
  belongs_to :member2, class_name: "Member"
end
