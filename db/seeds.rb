require 'random_data'
# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create Advertisements
25.times do
  Advertisement.create!(
  title: RandomData.random_word,
  body: RandomData.random_sentence,
  price: 100
  )
end

puts "Seeding Finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
