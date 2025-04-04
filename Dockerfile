FROM python:3.10-slim

COPY . .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
RUN echo 'import time; start = time.time(); while time.time() - start < 120: pass' > load.py
RUN python load.py

CMD ["python", "/src/main.py"]