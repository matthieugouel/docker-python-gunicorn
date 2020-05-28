# Docker Image : python-gunicorn

[![Build Status](https://travis-ci.org/matthieugouel/docker-python-gunicorn.svg?branch=master)](https://travis-ci.org/matthieugouel/docker-python-gunicorn)
[![Docker Build Status](https://img.shields.io/docker/build/matthieugouel/python-gunicorn.svg)](https://hub.docker.com/r/matthieugouel/python-gunicorn)
[![Docker Automated build](https://img.shields.io/docker/automated/matthieugouel/python-gunicorn.svg)](https://github.com/matthieugouel/docker-python-gunicorn)
[![license](https://img.shields.io/github/license/matthieugouel/docker-python-gunicorn.svg)](https://github.com/matthieugouel/docker-python-gunicorn/blob/master/LICENSE)

This image contains Gunicorn on top of the latest Python image.
It's mainly used for API development purposes.

Note : There is no Nginx in there. So static files are not managed.

## Usage

By default, the entry point of your application must be named as **run.py**. Moreover, the instance in that file must be called **app**.
Also, by default the worker class used is Gevent.

You can change that behavior running the container with a custom command (here only the name of the application has changed):

```
docker run -ti -p 127.0.0.1:8000:8000 local_api gunicorn wsgi:app -c /app/gunicorn.config.py
```

You can also include a custom Gunicorn configuration file into your application. By default the configuration file must be name as **gunicorn.config.py**

## Dockerfile example

Here is an example of a Dockerfile using that image :

```
FROM matthieugouel/python-gunicorn:latest
LABEL maintainer="Matthieu Gouel <matthieu.gouel@gmail.com>"

COPY ./app /app
RUN pipenv install --system --deploy --ignore-pipfile
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
