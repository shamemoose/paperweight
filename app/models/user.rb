class User < ActiveRecord::Base
	has_many :publications
  has_secure_password

  validates :name, presence: true, uniqueness: true
end
