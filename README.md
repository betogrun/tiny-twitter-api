# Tiny-twitter API

This project aims to replicate some popular features of Twitter and provides endpoints for creating and retrieving tweets via an API.
You can access the API documentation by navigating to `localhost:3000/api-docs` in your web browser after launching the application.

### Getting started

Follow the steps below to get the development environment up and running

### Create the database and run the migrations

```
docker-compose run --rm web bundle exec rails db:create
```

### Running
```
docker-compose up
```

## Running the tests
```
docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

## Generating the API documentation
```
docker-compose run --rm bundle exec rails rswag:specs:swaggerize
```

## Debugging

Get the web container id

```
docker ps
```

Attach your terminal to the container

```
docker attach container_id
```
