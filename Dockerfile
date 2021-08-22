FROM python:3

WORKDIR /usr/src/app

## Add configurations
#COPY python program to /usr/src/app
COPY url2.py ./

## Add required python modules to enable url query and prometheus metric
RUN pip install requests
&& pip install prometheus_client

## Execute python program
CMD [ "python", "./url2.py" ]

