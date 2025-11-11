FROM ruby:3.3.10

RUN \
    --mount=type=cache,target=/var/cache/apt \ 
    apt-get update -qq && apt-get install -y bash-completion \
    && echo ". /etc/bash_completion" >> ~/.bashrc

RUN gem install bundler -v 2.5.17

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install --quiet

COPY . /app/

EXPOSE 4000

CMD ["make", "serve-docker"]