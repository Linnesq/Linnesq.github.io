FROM ruby:2.7.4

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app/

EXPOSE 4000

CMD ["make", "serve-docker"]