# Build stage
FROM python:3.9-alpine AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.9-alpine

WORKDIR /app
# Copy Neccecery Packages From Last Container
COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
# Copy Gunicorn
COPY --from=builder /usr/local/bin/gunicorn /usr/local/bin/gunicorn

COPY . .

EXPOSE 5000
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]