# Stage 1: Build
FROM python:3.9-slim as build-stage
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY ./src /app

# Stage 2: Production
FROM python:3.9-slim
WORKDIR /app
COPY --from=build-stage /app /app
EXPOSE 5000
CMD ["python", "app.py"]
