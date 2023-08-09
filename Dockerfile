FROM ruby:3.2-alpine@sha256:ee39ade2cbda43fd466d787a595f142c9fa318284dd1d6b3e2f9590a9f4f75ab

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
