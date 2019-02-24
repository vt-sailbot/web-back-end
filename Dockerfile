FROM nginx:1-alpine

# Add Python dependencies
RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev make && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools

# Set up nginx
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/web-back-end.conf /etc/nginx/sites-available/web-back-end.conf
RUN ln -s /etc/nginx/sites-available/web-back-end /etc/nginx/sites-enabled
RUN nginx -c /etc/nginx/nginx.conf

# Move web-back-end files into app
COPY . /app
WORKDIR /app

# Build dependencies for web-back-end
RUN make init

# Restart nginx
RUN nginx -s stop; nginx
