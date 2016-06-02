# Base image
FROM ruby:latest
ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN bundle install

# Add the app code
ADD . $HOME

ENV CACHE_URL redis://redis:6379

# DB is fixed on database.yml
# ENV DB_URL postgresql://postgres:@db:5432



# Default command, is anyway specified in docker-compose.yml
CMD rails s
