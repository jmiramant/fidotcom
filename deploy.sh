#!/bin/sh

RAILS_ENV=development rake assets:precompile && git push heroku master
