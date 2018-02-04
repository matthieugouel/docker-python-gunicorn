FROM python:latest
MAINTAINER Matthieu Gouel

# Environment setting
ENV APP_ENVIRONMENT staging

# Flask demo application
COPY ./app /app
RUN pip install -r /app/requirements.txt

# Gunicorn installation
RUN pip install gunicorn gevent

# Gunicorn default configuration
COPY gunicorn.config.py /app/gunicorn.config.py

WORKDIR /app

EXPOSE 8000

CMD ["gunicorn", "run:app","--config", "/app/gunicorn.config.py"]
