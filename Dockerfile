FROM alpine:3.9

# Schedule
# default: * = every hour/day/month (-> no restriction)
ARG MINUTE=*         
ARG HOUR=*
ARG DAY_OF_MONTH=*
ARG MONTH=*
ARG DAY_OF_WEEK=*

# The command to execute
ARG COMMAND

# Configure cron
RUN mkdir /etc/cron
RUN echo "${MINUTE} ${HOUR} ${DAY_OF_MONTH} ${MONTH} ${DAY_OF_WEEK} ${COMMAND}" > /etc/cron/crontab
RUN echo "# empty line" >> /etc/cron/crontab

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]