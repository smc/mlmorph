FROM ubuntu:eoan
MAINTAINER Santhosh Thottingal "santhosh.thottingal@gmail.coom"
WORKDIR /app
COPY . /app
RUN apt-get update -y
RUN apt-get install -y make sfst hfst python3-pip
RUN make
