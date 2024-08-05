FROM ruby:3.3.4

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler -v 2.5.17 && bundle install

COPY . /app/

EXPOSE 4000

CMD ["make", "serve-docker"]