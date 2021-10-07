class Course < ApplicationRecord
  has_many :user_courses
  has_many :users
  has_many :courses, dependent: :destroy
  #accepts_nested_attributes_for :courses allow_destroy: true
end
