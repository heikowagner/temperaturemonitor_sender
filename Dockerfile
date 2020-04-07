FROM python:slim

RUN apt-get -y update
#RUN apt-get -y install python3-pip

#RUN pip3 install sanic
RUN apt-get -y install curl
COPY src/ ./src
RUN chmod 777 ./src/entrypoint.sh
CMD ./src/entrypoint.sh