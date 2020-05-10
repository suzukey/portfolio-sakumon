FROM ruby:2.7.1

ENV LANG C.UTF-8

RUN apt-get update

WORKDIR /app

ADD app/ ./

RUN bundle config --local disable_platform_warnings true
RUN bundle install

EXPOSE 3000
CMD ["bundle", "exec", "puma"]
