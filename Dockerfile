FROM ruby:2.3-slim

# Basic dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs 20 --retry 5

COPY . /app

# Precompile assets
RUN bundle exec rake assets:precompile RAILS_ENV=production || true

# Expose port
EXPOSE 3000

# Start server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
