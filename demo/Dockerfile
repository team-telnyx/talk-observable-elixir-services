# Build

FROM elixir:1.8.2-otp-22-alpine as build

ARG SERVICE_NAME
ENV SERVICE_NAME=${SERVICE_NAME}

RUN mix local.hex --force && \
  mix local.rebar --force

WORKDIR /demo

ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
COPY config config
COPY apps apps
COPY rel rel

RUN mix do deps.get, deps.compile
RUN mix release --env=prod

# Run

FROM alpine:3.11.10 as run

RUN apk upgrade --no-cache && \
  apk add --no-cache bash

EXPOSE 4000

ENV MIX_ENV=prod \
  REPLACE_OS_VARS=true \
  SHELL=/bin/bash

WORKDIR /demo

COPY --from=build /demo/_build/prod/rel/demo/releases/0.1.0/demo.tar.gz .

RUN tar xzf demo.tar.gz && rm demo.tar.gz

RUN addgroup -S app && adduser -S app -G app
RUN chown -R app /demo
USER app

ENTRYPOINT ["/demo/bin/demo"]
CMD ["foreground"]
