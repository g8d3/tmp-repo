README
======

This README document steps necessary to get the application up and running.

# Run with Vagrant

You need to install Vagrant and VirtualBox.

Then run `vagrant up`. It will take a good time the first time.

After virtual machine(VM) is running run `vagrant ssh` to connect to it.

Then install dependencies, setup database and run Rails server with:

```shell
cd /vagrant
bundle
rake db:setup
rails s -b 0.0.0.0
```

On another terminal run `vagrant ssh` and run Redis inside VM with:

```shell
redis-server
```

On another terminal run `vagrant ssh` and run Sidekiq inside VM with:

```shell
cd /vagrant
sidekiq
```

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
