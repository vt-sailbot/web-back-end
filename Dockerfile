FROM nginx:1-alpine

RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev make && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

COPY web-back-end.conf /etc/nginx/sites-available/web-back-end.conf
RUN ln -s /etc/nginx/sites-available/web-back-end /etc/nginx/sites-enabled

COPY . /app
WORKDIR /app

RUN make init

ENTRYPOINT nginx -s reload