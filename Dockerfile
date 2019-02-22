FROM nginx:1-alpine

RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev make && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

COPY nginx.conf /etc/nginx/nginx.conf

COPY . /app
WORKDIR /app

RUN make init