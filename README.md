# Github Zeitgeist


## Overview

Github Zeitgeist is a Rails Web Application to show how different events changed what people code in a certain period of time.
It uses Github Archive (http://www.githubarchive.org/) and Google BigQuery (https://developers.google.com/bigquery/) to get the statistics.

Find a working example at: http://github-zeitgeist.andresiglesias.net/

## Install

1. Fork the project
2. If you don't already have one, sign up for a Google account: https://accounts.google.com/SignUp
3. Create a BigQuery enabled project via the Google Developers Console: https://console.developers.google.com/project
4. Generate a new OAuth Client Id of type "Service account"
5. Generate a new P12 key, download it and place it in the following folder of the forked project 'config/keys/'
6. Edit "bigquery.rb" in 'config/initializers' with the Service Account information just generated. Change the key_file, client_id and email
7. Change your project number in the 'calculate' method in 'app/models/event.rb':
@project = XXXXX
You can get your project number in the overiew of your project in the Google Developers Console
8. Run 'rake db:setup'
9. Start the rails application: 'rails s'
10. Press 'Generate statistics' in the index page
11. Enjoy :)

## Add your own events

Adding your own events it's very simple. 

Go to 'db/seeds.rb'. 

You have an example already there. 

An event have the following structure: 

```ruby
event = Event.new
event.title = Event title
event.description = A description of the event
event.media = A link to an image or video
event.media_attribution = The attribution to the used media
event.media_description = A caption that explains the used media
event.since = The event start date
event.until = The event end date
event.compare = Put (1) if you want to compare the selected dates with the same period last month (the selected dates has to be included in one month), put (2) if you want to compare the selected dates with the same period last year
event.category = A category for the event
event.keyword_push = The keyword used to analyze if a word occurence increased in the selected period in PushEvents
event.keyword_repos = The keyword used to analyze if a word occurence increased in the selected period of time in new created repositories
event.language = A valid language used to analyze if the PushEvents increased for a certain language in the selected period of time
event.save
```

Be sure to execute 'rake db:seed' or 'rake db:setup' after you modify the file. 

## License & Credits

Github Zeitgeist was created by [Andrés Iglesias](http://andresiglesias.net) and it is
made available under the [MIT License](https://github.com/andresiglesias/github-zeitgeist/blob/master/LICENCE).
