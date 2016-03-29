FROM ruby:2.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3 nodejs
