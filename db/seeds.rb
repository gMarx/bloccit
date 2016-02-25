require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
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

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
