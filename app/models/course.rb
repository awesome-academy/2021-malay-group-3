class Course < ApplicationRecord
  enum status: {Opening: 0, Started: 1, Finished: 2}

  has_many :applies
  has_many :courses, dependent: :destroy
  has_many :users, through: :applies
  #accepts_nested_attributes_for :courses allow_destroy: true
end
