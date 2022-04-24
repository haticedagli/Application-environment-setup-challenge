# syntax=docker/dockerfile:1

FROM ubuntu:18.04
FROM python:2.7.18-slim-stretch

COPY . /Application-environment-setup-challenge
WORKDIR /Application-environment-setup-challenge

RUN apt-get update && apt-get -y install \
    default-libmysqlclient-dev build-essential curl
    
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "-m" , "application", "run", "--host=0.0.0.0"]