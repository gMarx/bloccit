require 'random_data'

####################################################
# create Users
5.times do
  User.create!(
    name:   RandomData.random_name,
    email:  RandomData.random_email,
    password: RandomData.random_word + '123'
  )
end

users = User.all

####################################################
# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_word,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all


####################################################
# Create SponsoredPosts

50.times do
  SponsoredPost.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: rand(25..50),
    topic: topics.sample
  )
end

sponsored_posts = SponsoredPost.all

####################################################
# Create Posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all


####################################################
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

admin = User.create!(
  name: 'Admin user',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

member = User.create!(
  name: 'Member user',
  email: 'member@example.com',
  password: 'helloworld'
)

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
puts "#{User.count} Users created."
puts "#{SponsoredPost.count} Sponsored Posts created."
puts "#{Question.count} questions created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
puts "#{Advertisement.count} advertisements created."
