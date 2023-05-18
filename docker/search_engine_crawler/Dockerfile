FROM python:3.6-alpine

COPY ./crawler /app
COPY ./requirements.txt /app

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip==21.3.1 && \
    pip install --no-cache-dir --requirement ./requirements.txt

ENTRYPOINT ["python3", "-u", "crawler.py", "https://vitkhab.github.io/search_engine_test_site/"]
