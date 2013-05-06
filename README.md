# **Introduction**

MoodApp is a Rails based application created in Atlassian's office and used to get internal feedback via iPads.

You can use it to display simple surveys on iPads in different locations and collect results in a single interface.

# **Deploying MoodApp on Heroku**
---

**1. Create your account on [Heroku](https://www.heroku.com/) and install the Heroku Toolbelt.**

**2. Clone the MoodApp repository on your computer.**

```
#!console
git clone -b master git@bitbucket.org:atlassianlabs/moodapp.git
```

**3. Create your new Heroku application from the MoodApp repository.**

```
#!console
cd moodapp

heroku create

git push heroku master
```

**4. Create the database.**

```
#!console
heroku rake db:migrate
```

**5. Open your new application!**

```
#!console
heroku open
```
  
  
  
# **Running MoodApp on your own server**
---

**Requirements:**

*   Rails 3.2
*   Ruby 1.9

**1. Clone the master branch of the MoodApp repository.**

```
#!console
git clone -b master git@bitbucket.org:atlassianlabs/moodapp.git
```

**2. Run the bundle command to install all the required gems.**

```
#!console
cd moodapp

bundle
```

**3. Create the database.**

By default MoodApp is using a SQLite3 database built-in with Rails. If you want to change those settings follow [instructions here](http://guides.rubyonrails.org/getting_started.html#configuring-a-database).

```
#!console
rake db:create

rake db:migrate
```

**4. Start your server!**

```
#!console
rails s
```

**5. You can now access your application by pointing your browser at [http://localhost:3000](http://localhost:3000).**
  
  
  
# **Getting Started with MoodApp**
---

** 1. Create the first admin user**

Sign up from the login page to create the first administrator

![](http://monosnap.com/image/ffckriYXVJf10fUOTcgXm71lc.png)

