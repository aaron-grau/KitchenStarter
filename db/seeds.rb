# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all

cities = City.create([
	{ name: 'Los Angeles' },
	{ name: 'New York' },
	{ name: 'Chicago'}
])

User.delete_all

user = User.create({
		name: 'Aaron Grau',
		email: 'aaron.r.grau@gmail.com',
		password: 'password12'
	})

guest = User.create({
		name: 'Guest',
		email: 'guest@gmail.com',
		password: 'password'
	})


Cuisine.delete_all

cuisines = Cuisine.create([
	{food: "Italian"},
	{food: "French"},
	{food: "Spanish"},
	{food: "Mexican"},
	{food: "Chinese"},
	{food: "Japanese"},
	{food: "Burgers"},
	{food: "Americano"},
	{food: "Barbecue"},
	{food: "Indian"},
	{food: "Thai"},
	{food: "Bar"}
])

Restaurant.delete_all

restaurants = []

file = File.open('app/assets/images/burger.jpg')

400.times do |i|
	target = 10000 + rand(50000)
	restaurants.push(Restaurant.create({user_id: user.id, cuisine_id: cuisines.shuffle.first.id, title: "Seed#{i}", city_id: cities[1].id, blurb: "Seed Seed Seed !!!", target: target, expiration: Date.parse("2016/09/16"), published: true, featured: true}))
end

3.times do |i|
	target = 10000 + rand(50000)
	restaurants.push(Restaurant.create({user_id: guest.id, cuisine_id: cuisines.shuffle.first.id, title: "Seed#{i}", city_id: cities[2].id, blurb: "Seed Seed Seed !!!", target: target, expiration: Date.parse("2016/09/16"), published: true, featured: true}))
end

Contribution.delete_all

4000.times do |i|
	x = rand(400)
	val = 200 + rand(3000)
 	Contribution.create(
		{user_id: user.id, restaurant_id: restaurants[x].id, value: val }
	)
end

5.times do |i|
	x = rand(400)
	val = 200 + rand(3000)
 	Contribution.create(
		{user_id: guest.id, restaurant_id: restaurants[x].id, value: val }
	)
end
