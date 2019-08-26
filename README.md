# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### To run

1. ``` bundle install ```
1. ``` redis-server ```
1. Open other terminal window and ``` rails s ```
1. Go to browser and access ``` localhost:3000/api/v1/players ```
1. start ``` redis-cli ``` in other terminal window
1. Create fake data and reload the web page


### references

[how to create a rails api only app](https://medium.com/jaguaribetech/criando-api-rest-com-ruby-on-rails-1ed90d252831)

[how to use redis as rails db](https://medium.com/@LuisOsnet/model-caching-using-redis-and-rails-5-4666b7e8031f)