# GuruTracker

GuruTracker is an app developed during Netguru Workshops Kraków-edition on 27 and 28 June 2015. This app allows you to manage your projects easily. You can organize people in projects, designate tasks for them and track tasks progress. There is also possibility to comment each project and task, so you can be in touch with your co-workers.


### Prerequisites
You will need the following things properly installed on your computer.
* Ruby 2.1.6
* Rails 4.2.1
* PostgreSQL
* Git

### Used gems
* Devise
* Decent Exposure
* Decent Decoration
* Gravastic
* jQuery Rails
* Bootstrap Sass
* Sass Rails
* Haml Rails
* Coffee Rails

### Getting started
Clone repository to your computer via command: 

`$ git clone https://github.com/netguru-training/psyche-group.git`

Next go to psyche-group directory `cd psyche-group` and run `bundle install`. This command will install all necessary gems and dependancies.

Then copy `database.yml` file `cp config/database.yml.example config/database.yml`
and fill it with proper username and password for your postgres.

Afterwards run command `rake db:setup`. This will create database and fill it with seeds data.

At the end start rails server `rails s` and go to address `http://localhost:3000/`

Now you can login with following credentials:
```
email: user@example.com
password: dontknow
```

Enjoy!

### Functionalities

1. Users
  * signing up
  * signing in
2. Projects
  * managing projects
  * adding people to projects
  * defining project start and end date
3. Tasks
  * managing tasks
  * assigning people to tasks
  * setting deadline
  * setting priority
  * setting status
4. Comments
  * adding comments to projects
  * adding comments to tasks

### Demo
See **GuruTracker** in action [here](http://gurutracker.herokuapp.com/).
