class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User associations
  has_many :enrollments, foreign_key: :student_id, dependent: :destroy
  has_many :batches, through: :enrollments, dependent: :destroy
  belongs_to :school, optional: true

  # User validations
  validates :role,:first_name, :last_name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def super_admin?
    role == 'super-admin'
  end

  def school_admin?
    role == 'school-admin'
  end

  def student?
    role == 'student'
  end
end
