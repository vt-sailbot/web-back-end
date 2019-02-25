# First build stage
FROM python:3.7-alpine AS build

# Move web-back-end files into the image
COPY . /app
WORKDIR /app

# Build dependencies for web-back-end
RUN apk add --no-cache make linux-headers g++ pcre pcre-dev \
    && make clean && make build


# Second and final build stage
FROM nginx:1.15-alpine

# Install Python package dependencies
RUN apk add --no-cache expat libffi gdbm xz-libs ncurses-terminfo-base \
    ncurses-terminfo ncurses-libs readline sqlite-libs pcre

# Move Python installation to second stage
COPY --from=build /usr/local/ /usr/local
ENV PATH /usr/local/bin:$PATH

# Move project from first stage into second stage
COPY --from=build /wheels /wheels
COPY --from=build /app /app
WORKDIR /app
RUN apk add --no-cache make && make init-from-wheels

# Configure nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/web-back-end.conf /etc/nginx/conf.d/web-back-end.conf
RUN rm /etc/nginx/conf.d/default.conf

ENTRYPOINT nginx -c /etc/nginx/nginx.conf; nginx -s reload; \
    /app/p3_7env/bin/uwsgi --ini /app/uwsgi/web-back-end.ini
