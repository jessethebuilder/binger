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

3. I would include much more robust error checking in
`DispatchCampaignJob#dispatch_campaign`. Here, I just selected a possible error,
but there are many other possibilities. I would likely install the Airbrake gem
and then single out each specific error. There are  several scenarios in which a
retry would be more appropriate than flagging the `Recipient` as "failed".

4. I would add request specs for every route, even if it is fairly trivial.

5. I would include more browser automation specs with Capybara.

6. I would include more robust CRUD for the Recipient and Campaign models. The
ability to edit and delete. The ability to remove Recipients. Technically, this
is not part of the specification at all, but, irl, it will likely be necessary.

7. I would include flash messages.

8. I would include a navigation bar.

9. I would abstract common Tailwind classes for, say, buttons, tables, headings,
and whatnot.
