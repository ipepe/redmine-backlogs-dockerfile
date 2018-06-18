# docker run -v ~/docker/redmine:/root/shared -p 8080:3000 --restart=unless-stopped -d --name redmine redmine:3.3.0
FROM redmine:3.3.0-passenger
# COPY redmine_backlogs.zip /usr/src/redmine/plugins
#RUN git clone https://github.com/backlogs/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone https://github.com/previousnext/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone -b "feature/redmine3" https://github.com/mamewotoko/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone https://github.com/AlexDAlexeev/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN git clone https://github.com/fukachi/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
#RUN apt-get update && apt-get install -y build-essential
RUN /docker-entrypoint.sh rails
RUN git clone https://github.com/ipepe/redmine_backlogs.git /usr/src/redmine/plugins/redmine_backlogs
RUN bundle install
RUN bundle exec rake redmine:backlogs:install RAILS_ENV=production story_trackers=Default task_tracker=Default
# https://backlogs.github.io/www/en/installation.html
