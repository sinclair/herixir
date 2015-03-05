# Herixir

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Messing about with Elixir, Phoenix, React and Heroku deployment.

## Steps

#### Generated a Phoenix app as instructed here
http://bit.ly/phoenix-getting-started

All commands in the following steps should be issued from the application root directory.

#### Creating the Heroku app with the Elixir build-pack

##### Initialization and Creation
```bash
git init
```

```bash
heroku create <your app name for heroku>
```

###### Heroku Elixir build-packs

Basically, Elixir is not a core language at this time so it is necessary to use an Elixir build-pack to deploy an Elixir app to Heroku.
More information can be found here, http://bit.ly/heroku-buildpack-api .

(Credit to, https://github.com/HashNuke/heroku-buildpack-elixir.git)

```bash
heroku buildpack:set https://github.com/HashNuke/heroku-buildpack-elixir.git
```
Note: The setting of the build-pack can occur when creating the Heroku app thus,

```bash
heroku create <your app name for heroku> --buildpack https://github.com/HashNuke/heroku-buildpack-elixir.git
```
This is an alternative approach which has the same.


###### Initializing elixir_buildpack.config

```bash
cat >> elixir_buildpack.config <<!
erlang_version=17.2
elixir_version=1.0.3
always_rebuild=true
!
```

##### Heroku run-time configuration

```bash
heroku config:set MIX_ENV=prod
```


##### Creating a Procfile for Heroku to launch the app
```bash
web: mix compile.protocols && elixir -pa _build/prod/consolidated -S mix phoenix.server
```

##### Run locally before deploying

```bash
heroku local
```
**Note**: Needs the 'foreman' ruby gem to be installed.

##### Deploying to Heroku (via _git push_)
###### Git commit
```bash
git commit -am "committed most recent changes"
```

###### Heroku deploy
```bash
git push heroku master
```
