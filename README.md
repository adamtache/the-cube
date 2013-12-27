The Cube Website
================

Getting Up and Running
----------------------

Run the following commands to make sure you are up to date before you start working on anything:

- git pull origin master
- bundle install
- bundle exec rake db:migrate

Do not commit/push if you have code that doesn't work! Make sure you test your shit at a bare minimum
by running rails s and making sure the page loads.


Admin Interface
---------------

Our admin interface is powered by ActiveAdmin. To login, visit http://localhost:3000/admin
(in production this will be our actual domain). One admin user will be created by the migrations.

Username: dukeincube@gmail.com
Password: 205alexander

We can create additional admin users as needed.

The admin interface allows you to add/edit/delete updates, which will probably appear on our homepage.
This functionality already works!