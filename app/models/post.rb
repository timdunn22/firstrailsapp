class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :summary, dependent: :destroy
  #
  # scope :ordered_by_title, -> {order('title asc') }
  # scope :ordered_by_reverse_created_at, -> { order('created_at desc') }
  belongs_to :user
  belongs_to :topic
  default_scope { order('rank DESC') }
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


 def markdown_title

   render_as_markdown(title)

 end

 def up_votes
     votes.where(value: 1).count
 end
 def down_votes
     votes.where(value: -1).count
 end
 def points
   votes.sum(:value)
 end

 def markdown_body
   render_as_markdown(body)
 end
 mount_uploader :image, ImageUploader
 def update_rank
      age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
      new_rank = points + age_in_days

      update_attribute(:rank, new_rank)
    end

 def create_vote
   user.votes.create(post: self, value: 1)
 end
 # def save_with_initial_vote
 #   ActiveRecord::Base.transaction do
 #     post2 = Post.create(title: 'Whatever', body: 'Post bodies must be pretty long.')
 #     post2.create_vote #=> throws error
 #   end
 # end

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
