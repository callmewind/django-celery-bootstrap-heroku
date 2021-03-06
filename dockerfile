FROM python:alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apk update && \
    apk --no-cache upgrade && \
    apk add --no-cache libxslt-dev && \
    apk add --no-cache --virtual .build-deps postgresql-dev gcc python3-dev musl-dev linux-headers libxml2-dev && \
    pip install -r requirements.txt && \
    apk del --no-cache .build-deps
