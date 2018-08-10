FROM python:3.7-slim

RUN apt-get update -y && apt-get install -y python-pip python-dev 

RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
RUN pip install flask-bcrypt
RUN pip install gunicorn flask
COPY . /app

ENTRYPOINT [ "gunicorn" ]
CMD [ "--bind=0.0.0.0:5002", "--workers=2", "--preload", "wsgi" ]
