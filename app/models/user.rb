class User < ApplicationRecord
  has_secure_password
  has_many :boards
  validates :name, :last_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }

end
