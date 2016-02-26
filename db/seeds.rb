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

####################################################

20.times do
  Advertisement.create!(
    title: RandomData.random_word,
    copy: RandomData.random_paragraph,
    price: rand(1..55)
  )
  advertisements = Advertisement.all

end

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
