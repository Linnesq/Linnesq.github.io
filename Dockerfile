FROM ruby:2.7.4

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler -v 2.4.22 && bundle install

COPY . /app/

EXPOSE 4000

CMD ["make", "serve-docker"]