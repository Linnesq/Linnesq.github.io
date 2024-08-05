FROM ruby:3.3.4

RUN apt-get update && apt-get install -y bash-completion && echo ". /etc/bash_completion" >> ~/.bashrc

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler -v 2.5.17 && bundle install

COPY . /app/

EXPOSE 4000

CMD ["make", "serve-docker"]