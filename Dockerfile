FROM elixir:1.6.6-otp-21

RUN mix local.hex --force \
 && mix local.rebar --force \
 && mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force \
 && curl -sL https://deb.nodesource.com/setup_8.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs npm build-essential inotify-tools

ENV APP_HOME /app
RUN mkdir -p $APP_HOME

# COPY . /app/src
COPY . /app

# RUN cd /app/src \
#     && rm -rf _build deps \
#     && mix deps.get \
#     && MIX_ENV=prod mix phx.digest \
#     && MIX_ENV=prod mix release --env=prod \
#     && mv _build/prod/rel/tech_test/* /app \
#     && rm -rf /app/src

RUN cd /app \
    && rm -rf _build deps \
    && MIX_ENV=prod mix deps.get \
    && MIX_ENV=prod mix phx.digest \
    && MIX_ENV=prod mix compile

WORKDIR $APP_HOME

EXPOSE 4000

CMD ["/app/run-init.sh"]
