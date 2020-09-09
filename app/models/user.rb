class User < ActiveRecord::Base
  has_secure_password

  # has_many :dtls, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3 }
end
