#!/bin/bash

# Wait for the database to be ready
echo "Waiting for the database to be ready..."
while ! nc -z db 5432; do
  sleep 1 # wait for 1 second before check again
done
echo "Database is ready!"

# RUN tar -xjf /catalog_files/tmp/catalog.tar.bz2 -C /catalog_files/tmp

# Perform database migrations
python manage.py migrate 

python manage.py updatecatalog

# Collect static files
python manage.py collectstatic --noinput

# Start the server
python manage.py runserver 0.0.0.0:8000