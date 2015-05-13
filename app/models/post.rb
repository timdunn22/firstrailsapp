class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary

  scope :ordered_by_title, -> {order('title asc') }
  scope :ordered_by_reverse_created_at, -> { order('created_at desc') }
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


 def markdown_title

   render_as_markdown(title)

 end

 def markdown_body
   render_as_markdown(body)
 end
 mount_uploader :image, ImageUploader

 private

 def render_as_markdown(markdown)
  #  options = [:hard_wrap,:filter_html]
  #  Redcarpet.new(markdown, *options).to_html.html_safe
   renderer = Redcarpet::Render::HTML.new
   extensions = {fenced_code_blocks: true}
   redcarpet = Redcarpet::Markdown.new(renderer, extensions)
   (redcarpet.render markdown).html_safe
 end

end
