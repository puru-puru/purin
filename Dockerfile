FROM ruby:2.4.3-alpine
RUN apk add --update --no-cache \
    build-base \
    libxml2-dev \
    libxslt-dev \
    sqlite-dev \
    tzdata \
    nodejs
WORKDIR /purin
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server"]
