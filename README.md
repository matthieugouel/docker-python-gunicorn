# Docker Image : python-gunicorn

[![Build Status](https://travis-ci.org/MatthieuGouel/docker-python-gunicorn.svg?branch=master)](https://travis-ci.org/MatthieuGouel/docker-python-gunicorn)
[![Docker Automated build](https://img.shields.io/docker/automated/matthieugouel/python-gunicorn.svg)](https://github.com/MatthieuGouel/docker-python-gunicorn)

This image contains Gunicorn on top of the latest Python image.
It's mainly used for API development purposes.

Note : There is no Nginx in there. So static files are not managed.

## Usage

By default, the entry point of your application must be named as **run.py**. Moreover, the instance in that file must be called **app**.
Also, by default the worker class used is Gevent.

You can change that behaviour running the container with a custom command (here only the name of the application has changed):

```
docker run -ti -p 127.0.0.1:8000:8000 local_api gunicorn wsgi:app -c /app/gunicorn.config.py
```

You can also include a custom Gunicorn configuration file into your application. By default the configuration file must be name as **gunicorn.config.py**

## Dockerfile example

Here is an example of a Dockerfile using that image :

```
FROM matthieugouel/python-gunicorn:latest
MAINTAINER Matthieu Gouel

# Copy the application
COPY . /app

# Install application requirements
RUN pip install -U pip
RUN pip install -r /app/requirements.txt
```

There is also a Flask demo application in the *app* folder of this repository.

## Build and run

First, build your image based on your Dockerfile.

```
docker build -t dev_api .
```

Then, you can run a container like this :

```
docker run -p 127.0.0.1:8000:8000 dev_api
```

You can access to your API with curl for instance :

```
curl localhost:8000
```
