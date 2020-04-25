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


names = %w(general react barcelona paris jobs)

channels = names.map do |name|
  Channel.find_or_create_by(name: name)
end

users = User.create!([
  {email: 'ejacobs@lewagon.com', password: 'testtest'},
  {email: 'ebouscasse@lewagon.com', password: 'testtest'},
  {email: 'gdavita@lewagon.com', password: 'testtest'}
])

20.times do
  Message.create! user: users.sample, channel: channels.sample, content: Faker::GreekPhilosophers.quote
end

puts 'Channels:'
channels.each do |channel|
  puts '-#{channel.id}: #{channel.name}'
end

