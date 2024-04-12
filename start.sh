#!/bin/bash 

# Language guides: https://grafana.com/docs/grafana-cloud/monitor-applications/application-observability/setup/quickstart/
export OTEL_EXPORTER_OTLP_PROTOCOL="grpc"
export OTEL_EXPORTER_OTLP_ENDPOINT="https://otlp-gateway-prod-sa-east-1.grafana.net/otlp"
# OTEL_EXPORTER_OTLP_INSECURE=true
export OTEL_RESOURCE_ATTRIBUTES="deployment.environment=development,service.namespace=poc,service.version=1.1,service.instance.id=python-api"
export OTEL_METRICS_EXPORTER=otlp
export OTEL_TRACES_EXPORTER=otlp
export OTEL_LOGS_EXPORTER=otlp
export OTEL_METRIC_EXPORT_INTERVAL=1000
# Python requires "Basic%20" instead of "Basic "
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Basic%20OTAzMTU1OmdsY19leUp2SWpvaU1UQTVOelF6TkNJc0ltNGlPaUp6ZEdGamF5MDVNRE14TlRVdGIzUnNjQzEzY21sMFpTMXdlWFJvYjI0dFptRnpkR0Z3YVNJc0ltc2lPaUprVlRWd2VsUTBNblV5TjNsRk5GaFFTRGwyTXpCQ2RUTWlMQ0p0SWpwN0luSWlPaUp3Y205a0xYTmhMV1ZoYzNRdE1TSjlmUT09"
export OTEL_SERVICE_NAME="python-api"
export OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED=true
export OTEL_PYTHON_LOG_CORRELATION=true
export OTEL_PYTHON_LOG_FORMAT="%(pathname)s:%(funcName)s:%(lineno)d:%(levelname)s:%(message)s"
# OTEL_PYTHON_LOG_LEVEL=info
export OTEL_PYTHON_LOG_LEVEL=debug
export COLLECTOR_OTLP_ENABLED=true

opentelemetry-instrument python main.py