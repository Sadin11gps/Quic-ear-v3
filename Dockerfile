FROM ruby:2.3-slim

# Archive repo for old Debian Buster
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs 20 --retry 5

COPY . /app

# Assets precompile (ignore error if not needed)
RUN bundle exec rake assets:precompile RAILS_ENV=production || true

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
