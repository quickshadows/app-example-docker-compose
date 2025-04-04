# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем зависимости
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируем приложение
COPY app.py /opt/build/app.py

# Запускаем приложение
CMD ["python", "app.py"]
