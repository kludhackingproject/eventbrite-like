class User < ApplicationRecord
  has_many :events
  has_many :attendances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { in: 6..200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end
