FROM ruby:2.7.1

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# For rails
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      nodejs \
      postgresql-client \
      sudo \
      vim \
      yarn \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prepare app directory
RUN mkdir -p /home/app/rails/

WORKDIR /home/app/rails

COPY bin/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/*

RUN gem update --system
RUN gem install bundler

ARG RAILS_MASTER_KEY

COPY Gemfile* /home/app/rails/

RUN bundle install -j8

ADD . /home/app/rails
