### Installation
Before getting started with the program, run the following commands:
* `bundle install`
* `rake db:migrate`
* `rake db:seed`

This executes your database migrations and sets up some seed data. Run `rake console` to interact with the database and models (e.g. `Review.all` will return all of the reviews).

To start the cli app, run `ruby bin/run.rb` from the root directory. 