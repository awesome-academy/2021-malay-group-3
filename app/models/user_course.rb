class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  default_scope -> { order(created_at: :desc) }
  validates :course_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
