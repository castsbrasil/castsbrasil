FROM ruby:2.3.1

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update -qq && apt-get install -y --force-yes build-essential \
    curl git vim nodejs
RUN mkdir -p /myapp

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD bower.json bower.json
RUN bundle install
RUN npm install -g bower-installer
RUN bower-installer

WORKDIR /myapp
ADD . /myapp

CMD ["rails", "server", "-b" "0.0.0.0"]
