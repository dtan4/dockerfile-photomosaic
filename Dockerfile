FROM ruby:2.2
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

RUN apt-get update && \
    apt-get install -y imagemagick && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

COPY Gemfile /usr/src/
COPY Gemfile.lock /usr/src/
RUN bundle install --without development test --system

CMD ["bundle", "exec", "photomosaic"]
