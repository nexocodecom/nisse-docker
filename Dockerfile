FROM python:3.6-slim

RUN apt-get update -y && apt-get install -y python-pip python-dev 

RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
RUN pip install flask-bcrypt
COPY . /app

ENTRYPOINT [ "flask" ]
CMD [ "run", "-h", "0.0.0.0", "-p", "5002" ]
