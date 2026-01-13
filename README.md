# README

TODO: Summary goes here.

## Development

### Runbook

#### Installation

```
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
```

This step is also necessary for testing.

##### Running the app

To start Postgres and Redis in Docker, in one console:

`docker-compose up`

To start the web server, Redis, and the Tailwind compiler:

`./bin/dev`

## Testing

`bundle exec rails rspec`
