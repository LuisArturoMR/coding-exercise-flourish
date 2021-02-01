# Coding Exercise LuisArturoMR -> API Reward Engine

## Install

### Clone the repository

```shell
git clone https://github.com/LuisArturoMR/coding-exercise-flourish.git
cd coding-exercise-flourish
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

* Ruby version: 2.7.2
##Run Tests
`bundle exec rspec`

##Services
    - EngineServices
    - AuthenticateUserService
    - TokenGenerationService

##Documentation

###Entities and Relations (DB)
https://docs.google.com/spreadsheets/d/1rCmnRmbDVY1lg7vO4utdypHIkTJ-GryTsScCGDaZrTw/edit?usp=sharing

###API Documentation
https://documenter.getpostman.com/view/2735195/TW6zG7AB#95a121c8-0649-46b3-ae26-4c9348f1d5b8

###DummyData(production)
* User1: pedro@flourishsavings.com
    * Authorization: `Bearer 9cc62f259bff5a3a5630adf98d5867c4`
* User2: nadilson@flourishsavings.com
    * Authorization: `Bearer a064507147b236176c73a2f7579537b1`
* User3: enrique@flourishsavings.com
    * Authorization: `Bearer ddd0d232c0eaf76824627977c3887346`
