# Introduction

MoodApp is a Rails based application created in Atlassian's office and used to get internal feedback via iPads.

You can use it to display simple surveys on iPads in different locations and collect results in a single interface.

# Installing MoodApp

## Deploying MoodApp on Heroku

1. Create your account on [Heroku](https://www.heroku.com/) and install the Heroku Toolbelt.

2. Clone the MoodApp repository on your computer.

`git clone -b master git@bitbucket.org:atlassianlabs/moodapp.git`

3. Create your new Heroku application from the MoodApp repository.

`cd moodapp`

`heroku create`

`git push heroku master`

4. Create the database.

`heroku rake db:migrate`

5. Open your new application!

`heroku open`

## Running MoodApp on your own server

MoodApp is a Rails based app, you will need to have:
* Rails 3.2
* Ruby 1.9

1. Clone the master branch of the MoodApp repository.

`git clone -b master git@bitbucket.org:atlassianlabs/moodapp.git`

2. Run the bundle command to install all the required gems

`cd moodapp`

`bundle`

3. Create the database

By default MoodApp is using a SQLite3 database built-in with Rails. If you want to change those settings follow [instructions here](http://guides.rubyonrails.org/getting_started.html#configuring-a-database).

`rake db:create`

`rake db:migrate`

4. Start your server!

`rails s`

5. You can now access your application by pointing your browser at http://localhost:3000