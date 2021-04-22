FROM ruby:2.6.2
ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo

RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update -qq \
    && apt-get install -y build-essential nodejs postgresql-client git\
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

ENV APP_HOME /var/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
COPY . $APP_HOME

ENV BUNDLE_DISABLE_SHARED_GEMS 1
RUN bundle install -j4

EXPOSE 3000
CMD [/bin/sh -c "rm -f /var/src/app/tmp/pids/server.pid;bundle exec rails s -b 0.0.0.0"]
