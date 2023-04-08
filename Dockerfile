FROM ruby:3.1.3
RUN apt-get update -qq && apt-get install -y build-essential vim curl sqlite3 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
RUN gem install bundler && bundle
COPY . /app
