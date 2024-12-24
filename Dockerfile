FROM python:3.10-slim-buster

USER root

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

RUN apt update -y && apt install -y build-essential libpq-dev 

RUN pip install --upgrade pip setuptools wheel && pip install -r requirements.txt

COPY analytics analytics

CMD python analytics/app.py  # Update the path to app.py
