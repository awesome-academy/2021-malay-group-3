class Course < ApplicationRecord
  belongs_to :user
  scope :newest, -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :course_name, presence: true, length: {maximum: 50}
end
