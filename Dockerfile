# AFM Northflank image: existing repository content is preserved in Git,
# while the copied backend/ directory is the deployable FastAPI service.
FROM python:3.11-slim
ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
WORKDIR /app/backend
COPY backend/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ ./
EXPOSE 8000
CMD ["sh", "-c", "uvicorn api_gateway.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
