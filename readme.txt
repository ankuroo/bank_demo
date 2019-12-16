README

For this coursework, I have used the following versions:
 - Rails version 5.2.3
 - Ruby version 2.6.3
 - Bundler version 2.0.2

 Development Environment
==============================
 To use the development environment, run the command:

    rails db:migrate RAILS_ENV=development

After this, run the command:

    rails s


Testing Environment
==============================
To use the testing environment, run the command:

    rails db:migrate RAILS_ENV=test

Once all the migrations have been run, use the following command to run the tests:

    rake test


Using the Site
==============================
Once logged in, to access the 'Transactions' page, click the logo (CSB) button on the navigation bar.