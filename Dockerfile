
FROM python:3.6

MAINTAINER WANGLI

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    git \
    vim \
    python-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    supervisor \
    gunicorn \
    nginx \
    net-tools \
    mysql-client

RUN mkdir /code

WORKDIR /code

ADD ./requirements /code/requirements

RUN pip3 --default-timeout=500 install -U Pillow

RUN pip3 install -r requirements/base.txt

CMD ["/bin/bash", "startweb.sh"]
