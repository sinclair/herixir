# Herixir

Messing about with Elixir, Phoenix, React and Heroku deployment.

## Steps

#### Generated a Phoenix app as instructed here
http://bit.ly/phoenix-getting-started

All commands in the following steps should be issued from the application root directory.

#### Creating the Heroku app
##### Initialization and Creation
```bash
git init
```

```bash
heroku create <your app name for heroku>
```

##### Heroku Elixir Build-pack
```bash
heroku config:set BUILDPACK_URL=https://github.com/HashNuke/heroku-buildpack-elixir.git -a <your customized app name>
```
```bash
heroku config:set MIX_ENV=prod
```

##### Creating a Procfile
```bash
web: yes | mix compile.protocols && elixir -pa _build/prod/consolidated -S mix phoenix.server
```

##### Initializing elixir_buildpack.config

```bash
cat >> elixir_buildpack.config <<!
erlang_version=17.2
elixir_version=1.0.3
always_rebuild=true
!
```

##### Heroku
```bash
git push heroku master
```
