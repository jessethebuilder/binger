# README

TODO: Summary goes here.

## Development

### Runbook

#### Installation

If you are using ASDF to manage tool versions, use the command below. This is
optional, so long as `ruby -v` yields "3.3.7".

```
asdf plugin update ruby
asdf install
```

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

## Future Improvements

1. The focus here was on low-level architecture and comprehensive testing, so
most improvements would be in UI/UX.

2. Having Recipients belong to many `Campaigns` would make sense under most
circumstances. `Campaigns` and `Recipients` could be associated through a model
like `CampaignRecipient` which would also hold the sending :status of that
`Campaign` for that `Recipient`.
