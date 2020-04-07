# What's the Story This Week?

## Rails

We're going to create a stand alone api in Rails with authentication. It's responsible for delivering shows (e.g. Great British Bake Off) as json.

We'll add authentication using the Devise gem for Rails. 

On Monday we'll create a Rails app for our shows using the two main parts of Rails. ActionPack and ActiveRecord. 

On Tueday we'll add users and favourites using ActiveRecord relations. This is like a many to many relationship we did in Sinatra.

On Wednesday we'll add authentication to our shows api so users must be logged in to access the shows.

On Thursday we'll add a React front-end running on a separate server and implement a signup and login form in React.

## Why Are We Doing This!?

This demonstrates a modern web architecture and introduces us to web based authentication. A stand alone API that is only responsible for delivering json and handling authentication is flexible enough to serve any front end. We'll be consuming the data with a React UI but it could just as easily be consumed by an Android app or any other front end application.
