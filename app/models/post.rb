class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary

  scope :ordered_by_title, -> {order('title asc') }
  scope :ordered_by_reverse_created_at, -> { order('created_at desc') }
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }
end
