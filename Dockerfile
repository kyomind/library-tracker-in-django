FROM python:3.8.12-slim-bullseye

WORKDIR /code
COPY requirements.txt .

RUN apt update \
    && apt update \
    && apt install -y apache2 libapache2-mod-wsgi-py3 \
        nano vim \
        build-essential default-mysql-client default-libmysqlclient-dev \
        libssl-dev libcrypto++-dev \
        redis-server \
        docker.io gnupg2 pass \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["/bin/bash", "Dockerize/init.sh"]