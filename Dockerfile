FROM ruby:2.7.1

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app/

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0" ]