FROM python:3

USER root

WORKDIR /usr/src/app

## Add configurations
#COPY python program to /usr/src/app
COPY url2.py ./

## Add required python modules to enable url query and prometheus metric
RUN pip install requests
&& pip install prometheus_client
## Creating a non root user to run further commands from this point onwards as good security practice.
&& useradd -ms /bin/bash pythonuser

USER pythonuser

## Execute python program
CMD [ "python", "./url2.py" ]

