class Enrollment < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :batch

  validates :status, presence: true
  enum status: { Requested: 0, Accepted: 1, Denied: 2 }

end
