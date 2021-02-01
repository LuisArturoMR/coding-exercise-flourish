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


