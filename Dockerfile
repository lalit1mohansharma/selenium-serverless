FROM python:3.7
RUN apt update && apt install -y chromium-driver
RUN pip install selenium flask gunicorn
ADD . /app
WORKDIR /app

EXPOSE 8080

# Start Flask app with Gunicorn
CMD exec gunicorn --bind :8080 --workers 1 --threads 8 --timeout 0 app:app
