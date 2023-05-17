FROM ruby:3.2-alpine@sha256:1df6125b0f90e087123698e1b2df1c6a544a40033a5a14bfa3ef7067863d3474

LABEL version="2.0.1"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
