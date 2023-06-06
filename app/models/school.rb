class School < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :batches, through: :courses, dependent: :destroy

  validates :name,:address, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
