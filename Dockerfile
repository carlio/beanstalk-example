FROM python:3.8.6-alpine3.12

COPY . /app

WORKDIR /app

RUN pip3 install -r requirements.txt

WORKDIR /app/beanxample

EXPOSE 8000

RUN ./manage.py migrate
CMD ./manage.py runserver

