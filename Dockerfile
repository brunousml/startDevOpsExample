FROM python:3-alpine
MAINTAINER Bruno Melo <brunousml@gmail.com>

WORKDIR /app

RUN apk update && \
    apk upgrade &&  \
    apk add --update --no-cache alpine-sdk libxml2-dev libxslt-dev

COPY . .
