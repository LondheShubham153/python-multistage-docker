# Stage 1: Build the Flask Application
FROM python:3.9 AS backend-builder

WORKDIR /app

COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY backend/ .

# Stage 2: Final Image
FROM python:3.9-slim-buster

WORKDIR /app

COPY --from=backend-builder /app /app

EXPOSE 5000

CMD ["python", "app.py"]

