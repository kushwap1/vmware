FROM python:3

WORKDIR /usr/src/app

COPY url2.py ./

RUN pip install requests
RUN pip install prometheus_client


CMD [ "python", "./url2.py" ]

