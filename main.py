import random
import logging
import os
import sys
from fastapi import FastAPI

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

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app)