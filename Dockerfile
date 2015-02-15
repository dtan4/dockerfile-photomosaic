FROM ruby:2.2
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

RUN apt-get update && \
    apt-get install imagemagick && \
    rm -rf /var/lib/apt/lists*

RUN mkdir /usr/src
WORKDIR /usr/src

COPY Gemfile /usr/src/
COPY Gemfile.lock /usr/src/
RUN bundle install --without development test --system

CMD ["bundle", "exec", "photomosaic"]
