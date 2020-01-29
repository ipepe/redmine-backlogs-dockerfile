FROM redmine:3.4.2-passenger
#RUN git clone https://github.com/previousnext/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone -b "feature/redmine3" https://github.com/mamewotoko/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone https://github.com/fukachi/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs

RUN apt-get update && apt-get install -y build-essential
RUN /docker-entrypoint.sh rails
RUN git clone https://github.com/ipepe/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
RUN bundle install -j 4
RUN bundle exec rake redmine:backlogs:install RAILS_ENV=production story_trackers=Default task_tracker=Default

