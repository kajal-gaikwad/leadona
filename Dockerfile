FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# If using Capybara - deprecation warning
# RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# lib for postgresql
RUN apt-get install -y libpq-dev

RUN apt-get install -y postgresql-client

ENV APP_HOME /leadona
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN gem install bundler
RUN bundle install
COPY package.json yarn.lock $APP_HOME/
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs
RUN apt-get install -y npm
RUN npm install -g yarn
RUN yarn install --check-files
COPY . $APP_HOME


# Add a script to be executed every time the container starts.
COPY /dockerinit/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]