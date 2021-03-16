FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN apt-get update -y
RUN apt-get install -y make sfst python3-pip
RUN make
