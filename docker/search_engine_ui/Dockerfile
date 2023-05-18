FROM python:3.6-alpine

COPY ./ui /app
COPY ./requirements.txt /app

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip==21.3.1 && \
    pip install --no-cache-dir --requirement ./requirements.txt

ENV FLASK_APP ui.py

ENTRYPOINT ["gunicorn", "ui:app", "-b", "0.0.0.0"]
