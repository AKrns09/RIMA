FROM ruby:3.2.2

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY . /usr/src/app/
ARG SECRET_KEY_BASE

WORKDIR /usr/src/app
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}
RUN gem install bundler:2.2.9
RUN bundle install
RUN rake db:migrate
RUN rails assets:precompile
CMD [ "rails", "server"]
