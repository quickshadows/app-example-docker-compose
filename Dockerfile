FROM python:3.10-slim

COPY . .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential xargs

COPY requirements.txt .
RUN cat /app/requirements.txt | xargs -n 1 -P 0 pip install --no-cache-dir  --ignore-installed --quiet
EXPOSE 8000

CMD ["python", "/src/main.py"]