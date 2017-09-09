User.create!(username: "aaa", email: "a@a.com", password: "password")
User.create!(username: "bbb", email: "b@b.com", password: "password")

Restaurant.create!(name: "Devil Dawgs", cuisine: "hot dogs", address: "123 Fake Street", city: "Chicago", state: "IL", zip: 60613, creator_id: 1)
Restaurant.create!(name: "Portillos", cuisine: "cake shakes", address: "987 N Washington Avenue", city: "Tampa", state: "FL", zip: 10041, creator_id: 1)
Restaurant.create!(name: "Brick House", cuisine: "seafood", address: "564 Wacker Drive", city: "Chicago", state: "IL", zip: 45614, creator_id: 2)

Review.create!(rating: 5, description: "Amazing! The best in town.", restaurant_id: 1, author_id: 1)

Review.create!(rating: 2, description: "The manager was very rude.", restaurant_id: 1, author_id: 2)

Review.create!(rating: 4, description: "I had a good experience eating here.", restaurant_id: 2, author_id: 1)

Review.create!(rating: 3, description: "Meh.", restaurant_id: 2, author_id: 2)

Review.create!(rating: 1, description: "Don't ever eat here.",restaurant_id: 3, author_id: 1)
