#!/usr/bin/python

# Using prometheus_client module of Python helps in instrumenting time series metric for python program
# request_processing_seconds_count: Number of times this function was called.
# request_processing_seconds_sum: Total amount of time spent in this function.
import requests
from prometheus_client import start_http_server, Summary

# Create a metric to track time spent and requests made.

REQUEST_TIME = Summary('url_200_request_processing_seconds', 'Time spent processing request')

@REQUEST_TIME.time()
def process_request(url):

    """function that get response time of url"""
    response1 = str(requests.get(url))

    if response1[11:14] == '200':
        requests.get(url).elapsed.total_seconds()

if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8001)
    # Generate some requests by passing url.
    while True:
        process_request('https://httpstat.us/200')
