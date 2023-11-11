FROM ruby:2.5

RUN apt-get update && apt-get upgrade -y
RUN gem update --system 3.2.3
RUN gem install bundler
RUN mkdir /app
COPY Gemfile /app
COPY Gemfile.lock /app

ENV RAILS_ENV=production
ENV TS_PORT=3000

WORKDIR /app
RUN bundle install

COPY . /app

RUN bundle exec rails assets:precompile

run chmod +x ./start.sh

CMD ./start.sh
