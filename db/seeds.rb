require 'faker'

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 Post.create!(
  title: "The Tim Post",
  body: "We are wonderful because we do Rails!
  We are way better than php people
  and Java people."
 )
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 Comment.create!(
  post: posts.sample,
  body: "Why would anyone comment on a post this random.
  Seriously they don't seem to make any sense! "
 )

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
