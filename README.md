README
======

This README document steps necessary to get the application up and running.

* Ruby version

2.3.0p0

* System dependencies

`bundle` to install all gems.

Some dev libraries might be required to install some gems:

```
sudo apt-get install -y libpq-dev
```

Install Redis and run it. See http://redis.io/topics/quickstart.

* Database creation and initialization

`rake db:create db:migrate`

* How to run the test suite

`rake test`

* Deployment instructions

I use Heroku with add ons:

- PostgreSQL
- Redis

`git push heroku master` is enough after a Heroku application is created and provisioned.

To set ENV variables use `figaro heroku:set -e production`. Variables are set at `config/application.yml`.

More about figaro at https://github.com/laserlemon/figaro.

# TODO

- what cache type to use
- how to test cache in development
- set job to cache tweets each 1:30
- define tweet columns to save
- define way of visualizing tweets
