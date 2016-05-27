README
======

This README document steps necessary to get the application up and running.

# Ruby version

2.3.0p0

# System dependencies

`bundle` to install all gems.

Some dev libraries might be required to install some gems:

```
sudo apt-get install -y libpq-dev
```

Install Redis and run it. See http://redis.io/topics/quickstart.

# Database creation and initialization

`rake db:create db:migrate`

# How to run the test suite

`rake test`

# Deployment instructions

1. Create a Heroku application with `heroku create name_of_your_app`

1. From Heroku web interface you can configure these add ons:

- PostgreSQL
- Redis

1. Create a Twitter application at https://apps.twitter.com/.

1. There is file `config/application.yml.sample` you can copy to
`config/application.yml`. With 4 fields you get from Twitter application.

1. To set ENV variables use `figaro heroku:set -e production`. Variables are
set at `config/application.yml`.

More about figaro at https://github.com/laserlemon/figaro.

1. `git push heroku master` to upload code to Heroku.
