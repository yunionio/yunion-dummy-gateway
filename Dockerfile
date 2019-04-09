# Dockerfile taken from https://github.com/jordansissel/fpm/blob/master/Dockerfile
#
# To build this Docker image: docker build -t fpm .
#
# To run this Docker container interactively: docker run -it fpm
#
FROM alpine:3.9

RUN apk add --no-cache \
        ruby \
        ruby-dev \
	ruby-etc \
        gcc \
        libffi-dev \
        make \
        libc-dev \
        rpm \
    && gem install --no-ri --no-rdoc fpm
