require 'random_data'


# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_word,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    topic: topics.sample
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(
  title: 'Hakuna matata',
  body: 'a Swahili phrase; translated, it roughly means "No worries". It is formed by the words hakuna (there is not here) and matata (plural form of problem).'
)

Comment.find_or_create_by(
  post: Post.find_by(title: 'Hakuna matata', body: 'a Swahili phrase; translated, it roughly means "No worries". It is formed by the words hakuna (there is not here) and matata (plural form of problem).'),
  body: 'That is where we are, ladies and gentlemen.'
)

####################################################

20.times do
  Advertisement.create!(
    title: RandomData.random_word,
    copy: RandomData.random_paragraph,
    price: rand(1..55)
  )
  # advertisements = Advertisement.all

end

####################################################

30.times do
  Question.create!(
    title: RandomData.random_word,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

####################################################
puts 'Seed finished'
puts "#{Topic.count} Topics created."
puts "#{Question.count} questions created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
puts "#{Advertisement.count} advertisements created."
