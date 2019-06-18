# Rails - Flight Booker

This [project](https://www.theodinproject.com/lessons/building-advanced-forms) is an exercise in creating advanced forms in rails with helpers such as select() and collection_select(). It also covers creating nested attributes for model associations that include accepts_nested_attributes_for, with the fields_for helper. For the purposes of this project, a user does not need to make an account or log in to use the app. This project is meant to solidify advanced concepts in form creation with rails helpers.

[View on heroku](https://learnsometing-flight-booker.herokuapp.com/)

OR

Follow the directions under `Getting Started` to get a local copy up and running.

## Features

Flight search form contained in the site navigation header.
- pick a starting airport, an airport to travel to, the date, and the number of passengers you will buy tickets for
- collection_select() used to populate the to and from airport dropdowns
- select() used to populate the date and passengers dropdown

Search results are returned as a form. The user can pick a flight by clicking its associated radio button.
- radio_button() helper used to create the buttons for each flight
- a hidden field is used to set the number of passengers passed in params to the Bookings Controller

The booking form displays information about the flight the user chose, and has a field for each passenger's name.
- the number of passengers passed in params is used in Bookings#new to build the required number of passengers for the booking
- the fields_for() helper is used to submit the passenger names to the Bookings Controller

## Getting Started

### Requirements

- Ruby 2.6.1
- Rails 5.2.3

### Installation

- Clone the repo
- run bundle install to install all dependencies
- run rails test to make sure all tests pass

### Author

Brian Monaccio
