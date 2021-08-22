# vmware assignment

This Python service running on K8s accessing 2 urls and querying status code 503, 200 and getting response time.

This service uses prometheus_client library to start a http server and using Summary instrumenting metric injesting request_processing_seconds metric into prometheus.

request_processing_seconds_count: Number of times this function was called.
request_processing_seconds_sum: Total amount of time spent in this function.

Upon dividing request_processing_seconds_count / request_processing_seconds_sum, we get response time taken by each function which in turn hitting url * 1000 will give time in ms.

logs are in Time series format to be ingested into Prometheus and Grafana.

Two deployments and services (nodePort)  have been configured managing each url separately. These nodePort service have been configured in prometheus.yaml to listen on these port numbers.


