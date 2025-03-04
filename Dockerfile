FROM node:22-alpine AS base

RUN apk add --no-cache bash

USER node

ENV APP_PATH=/home/node/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY --chown=node:node package.json package-lock.json tsconfig.json $APP_PATH/

# Development:
FROM base AS development
USER node