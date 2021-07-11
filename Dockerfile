FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN apt-get update -y
RUN apt-get install -y make sfst python3-pip
RUN make
# Build documentation
WORKDIR /app/docs
RUN npm ci
RUN npm run docs:build
# Build web API
WORKDIR /app/web
RUN pip install -r requirements.txt
# To start the web interface
# CMD gunicorn mlmorphweb:app