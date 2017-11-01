class User < ApplicationRecord
  validates :loginid, presence: true, length: { maximum: 50 }
  has_secure_password 
end
