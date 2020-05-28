FROM python:3.7
LABEL key="Matthieu Gouel <matthieu.gouel@gmail.com>"

WORKDIR /app

RUN pip install pipenv gunicorn gevent

COPY ./app /app
RUN pipenv install --system --deploy --ignore-pipfile

COPY gunicorn.config.py /app/gunicorn.config.py

EXPOSE 8000

CMD ["gunicorn", "run:app","--config", "/app/gunicorn.config.py"]
