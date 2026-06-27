FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN apt-get update -y
RUN apt-get install -y make sfst python3-pip
RUN pip install uv
RUN make
# Build documentation
WORKDIR /app/docs
RUN npm ci
RUN npm run docs:build
RUN cp -r /app/docs/.vitepress/dist /app/web/public
# Build web API
WORKDIR /app/web
RUN uv sync --frozen
# To start the web interface
# CMD gunicorn mlmorphweb:app