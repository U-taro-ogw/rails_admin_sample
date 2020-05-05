# ビルド用
FROM ruby:2.7.0-alpine3.11 AS builder

RUN apk --no-cache add --virtual build-dependencies \
    build-base git mysql-dev tzdata

RUN apk --no-cache add \
    bash mariadb-dev nodejs yarn

ENV APP_PATH /work
WORKDIR $APP_PATH

COPY Gemfile $APP_PATH
COPY Gemfile.lock $APP_PATH
ENV BUNDLE_JOBS=4
RUN gem i bundler:2.1.4 && bundle install

COPY package.json $APP_PATH
COPY postcss.config.js $APP_PATH
COPY yarn.lock $APP_PATH
COPY . $APP_PATH
RUN bin/yarn install
RUN apk del build-dependencies

# 開発用
FROM ruby:2.7.0-alpine3.11
RUN apk --no-cache add \
    bash mariadb-dev nodejs yarn build-base mysql-dev git tzdata && gem i bundler:2.1.4

ENV APP_PATH /work
WORKDIR $APP_PATH
COPY . $APP_PATH
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder $APP_PATH/node_modules $APP_PATH/node_modules

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
