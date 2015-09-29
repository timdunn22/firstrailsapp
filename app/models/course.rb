class Course < ActiveRecord::Base
  has_many :students, through: :course_students
  has_many :attachments, through: :attachment_courses
  has_many :attachment_courses
  has_many :student_courses
  accepts_nested_attributes_for :attachment_courses
  accepts_nested_attributes_for :student_courses
end
