FROM python:3.10-slim

COPY . .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential

COPY requirements.txt .
RUN pip instaall --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD ["python", "/src/main.py"]
