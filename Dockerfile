FROM ruby:3.2.2

ENV BUNDLE_PATH /usr/local/bundle

RUN apt-get update -qq && apt-get install -y build-essential libssl-dev

WORKDIR /usr/src/tiny-twitter-api

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
