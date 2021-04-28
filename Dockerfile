FROM ruby:2.6.2
ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo

RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update -qq \
    && apt-get install -y build-essential nodejs postgresql-client git\
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn

ENV APP_HOME /var/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

ENV BUNDLE_DISABLE_SHARED_GEMS 1
RUN bundle install -j4

COPY . $APP_HOME

RUN rm -rf public/assets \
    && bundle exec rails assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-e", "production"]
