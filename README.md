# Bank App
This is my COM2025 coursework project. I have made a bank application which allows users to create, cards, payees and transactions.
## System Specification
In order to be able to run this app, please ensure you have the following software, with the same versions.
**Rails version:** 5.2.3
**Ruby version:** 2.6.3
**Bundler version** 2.0.2
## Setting up the Site
In order to run the site, you must first set it up.
### Development Environment
To set up the development environment, whilst inside the root directory of the app, run the command:

    rails db:migrate RAILS_ENV=development
After this, to launch the server, run the command:

    rails s
### Testing Environment
To set up the testing environment, whils in the root directory of the app, run the command:

    rails db:migrate RAILS_ENV=test
Once all the migrations have been run, use the following command to run the tests:

    rake routes
## Using the site (Important)
Many features of the site will be closed unavailable, when the user is not logged in.

While not logged in, the user will have access to:
 - The home page
 - The login page
 - The registration page
 - The contact page

Once logged in, the user will have access to all other features:
 - Transactions (Creation and Viewing)
 - Payees (Creating, Reading, Updating, Deleting)
 - Cards (Creating, Reading, Updating, Deleting)
### Navigating the Site (important)
Once logged in, the navigation bar will change to enable access to more features.
**In order to access the Transactions page, click the logo (CSB) on the navigation bar.**