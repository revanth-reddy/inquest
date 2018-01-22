FROM ruby:2.3.3
LABEL maintainer "amankumar.msjps@gmail.com"

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  sqlite3 \
  libsqlite3-dev

RUN mkdir -p /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
WORKDIR /myapp
RUN bundle install --without development test

EXPOSE 3000
CMD ["bash"]
