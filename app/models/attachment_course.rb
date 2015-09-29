class AttachmentCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :attachment
end
