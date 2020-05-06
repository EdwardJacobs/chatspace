# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
User.destroy_all
Channel.destroy_all


names = %w(general ruby javascript react rails design jobs)

channels = names.map do |name|
  Channel.find_or_create_by(name: name)
end

users = User.create!([
  {
    email: 'ejacobs@gmail.com',
    password: 'testtest',
    nickname: 'edward',
    avatar_url: 'https://avatars.githubusercontent.com/EdwardJacobs'
  },
  {
    email: 'ebouscasse@gmail.com',
    password: 'testtest',
    nickname: 'ellyn',
    avatar_url: 'https://avatars.githubusercontent.com/EllynBsc'
  },
  {
    email: 'gdevita@gmail.com',
    password: 'testtest',
    nickname: 'gus',
    avatar_url: 'https://avatars.githubusercontent.com/devitagus'
  },
  {
    email: 'eminem@gmail.com',
    password: 'testtest',
    nickname: 'marshall',
    avatar_url: 'https://avatars.githubusercontent.com/eminem'
  },
  {
    email: 'elon@gmail.com',
    password: 'testtest',
    nickname: 'elon',
    avatar_url: 'https://avatars.githubusercontent.com/elonmuskceo'
  },
  {
    email: 'lacoste@gmail.com',
    password: 'testtest',
    nickname: 'lance',
    avatar_url: 'https://avatars.githubusercontent.com/lacostenycoder'
  }
])

20.times do
  Message.create! user: users.sample, channel: channels.sample, content: Faker::GreekPhilosophers.quote
end

puts 'Channels:'
channels.each do |channel|
  puts '-#{channel.id}: #{channel.name}'
end

