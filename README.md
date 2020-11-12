# Project Tracker


## About

This is an application to better track a number of growing projects within an organisation for different stakeholders.

## Code Related Design Decisions

* Have made use of [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) as the serialization time is at least 25 times faster than Active Model Serializers

* Have made use of an `enum` type to handle the different Project related statuses. Additionally,  appropriate DB and application level constraints are added to ensure data integrity.

* Have made use of appropriate Validator and Service classes for checking employee role as part of project creation in order to adhere with the Single Responsibility Principle

* Have added appropriate request, model, service class and validator level specs to ensure the code has sufficient test coverage alongside ensuring edge cases are also covered


## Usage

### Dependencies
* Ruby 2.7.0
* Please refer to the `Gemfile` for the other dependencies

### Setup
* Run `bundle` from a project's root directory to install the related dependencies.

### Running the program
In order to be able to be up and running with the app, one would have to follow the below steps:

From the project root directory:
* Create a `.env` file with the appropriate Employee API service URL using the `.env.sample` file present in the project root directory as a reference. Please note this step is applicable only when developing locally. The environment variables present in `.env.sample` need to be appropriately added when deploying to a production environment using different providers like `Heroku`, `AWS` etc.,
* Start the rails app in the development environment with: `rails s`

One should now be able to create a new Project with an appropriate owner and one can make use of an appropripate API client like Postman to test the same.


### Running the tests
* One can run the specs from the project's root directory with the command `rspec`

