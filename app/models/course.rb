class Course < ApplicationRecord
  belongs_to :school
  has_many :batches, dependent: :destroy

  validates :name,:description, :duration, :start_date, :end_date, presence: true
end
