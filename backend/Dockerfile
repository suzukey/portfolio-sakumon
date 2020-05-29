FROM ruby:2.7.1

ENV LANG C.UTF-8

RUN apt-get update

WORKDIR /app

COPY app/Gemfile .
COPY app/Gemfile.lock .

RUN bundle install

COPY app/ .

ENV RAILS_ENV=development

EXPOSE 3000
CMD ["bundle", "exec", "puma"]
