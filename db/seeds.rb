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

Channel.create(name: 'general')
Channel.create(name: 'paris')
Channel.create(name: 'react')

User.create(email: 'eddielawrence23@gmail.com')

Message.create(user: 'eddielawrence23@gmail.com' channel: 'general' content: "Hello world");
