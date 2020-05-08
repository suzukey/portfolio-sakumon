FROM ruby:2.7.1
ENV LANG C.UTF-8

WORKDIR /app
ADD ./app/Gemfile Gemfile
ADD ./app/Gemfile.lock Gemfile.lock
RUN bundle config --local disable_platform_warnings true
RUN bundle install

ADD app/ ./

CMD ["bundle", "exec", "puma"]
