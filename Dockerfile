FROM redmine:3.4.2-passenger

ENV RAILS_ENV=production

RUN apt-get update && apt-get install -y build-essential
RUN /docker-entrypoint.sh rails
RUN bundle install -j 4

COPY default_issue_tracker.rb ./vendor
RUN rails r ./vendor/default_issue_tracker.rb

RUN git clone https://github.com/wyplay/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
RUN cd /usr/src/redmine/plugins/redmine_backlogs && git checkout b2424fe9882662354fc19db14b4e04fe219b533e
RUN bundle install -j 4
RUN bundle exec rake redmine:backlogs:install epic_trackers=Default story_trackers=Default task_tracker=Default

