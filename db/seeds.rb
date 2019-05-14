# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(name: 'faizan', username: 'faizan', password_digest: 'faizan', funds: 10000)

s1 = Stock.create(name: "Apple", ticker: "AAPL", price: 189, headline: 'headline', image: 'image', article: 'article')
s2 = Stock.create(name: "Amazon", ticker: "AMZN", price: 1904, headline: 'headline', image: 'image', article: 'article')

t1 = Transaction.create(user_id: u1.id, stock_id: s1.id, stock_price: 189, quantity: 2, date_transaction: 'May 15')

w1 = Watchlist.create(user_id: u1.id, stock_id: s2.id)