class User < ApplicationRecord

    has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :tasks

  has_many :lists

end
