# Menu

This Rails app displays receipes stored in Contentful


## Running it

### Building

**Docker** is the only requirement. This command will build the docker image, install the gems and setup the database

```bash
make init
```
Alternatively, you can install Ruby 2.7.1, Postgresql, bundler,
and run the migrations, which should be:

```bash
# install rvm
rvm install 2.7.1
rvm use 2.7.1
gem install bundler
bundle install
bundle exec rake db:create db:schema:load db:migrate
```

### Starting it locally

This will just start the server with the database using `docker-compose`
```
make server
```

### Running the tests

```bash
make test
```
