
FROM ruby:2.4

LABEL maintainer="sas145alex@gmail.com"

# allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
apt-transport-https

# ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
tee /etc/apt/sources.list.d/yarn.list

# install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
nodejs \
yarn

RUN echo 'gem: --no-document' >> /etc/gemrc

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
