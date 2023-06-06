class Batch < ApplicationRecord
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, dependent: :destroy

  validates :name,:capacity, :description, :start_date, :end_date, presence: true
end
