FROM ruby:3.2.1

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_JOBS="4" \
    BUNDLE_NO_CACHE="true" \
    BUNDLE_WITHOUT="development,test" \
    GEM_HOME="/usr/local/bundle"

RUN apt-get update -qq && apt-get install -y build-essential git

WORKDIR /usr/src/tiny-twitter-api

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
