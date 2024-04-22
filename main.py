import random
import logging
import os
import sys
from fastapi import FastAPI
# from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor

app = FastAPI()

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
stream_handler = logging.StreamHandler(sys.stdout)
log_formatter = logging.Formatter(os.getenv('OTEL_PYTHON_LOG_FORMAT'))
stream_handler.setFormatter(log_formatter)
logger.addHandler(stream_handler)

@app.get('/')
def root():

    randon_int = int(random.random() * 100)
    logger.info(f'Testando OTEL e Grafana Cloud call no.: {randon_int}')
    return {'call': randon_int}


@app.put('/{chamada}')
def put_root(chamada:int):
    logger.info(f'Testando OTEL e Grafana Cloud call no.: {chamada}')
    return {'call': chamada}

# FastAPIInstrumentor.instrument_app(app)

# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run(app)