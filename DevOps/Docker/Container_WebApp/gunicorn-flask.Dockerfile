# Base - Use Python
FROM python:3.9-slim-buster

# Set the Working Directory Inside The Container
WORKDIR /app

# Copy The Requirements.txt To The Container (to /app - .)
COPY requirements.txt .

# Install Dependencies and --no-cache-dir Will NOT Save in Cache So Size Will Be Smaller
RUN pip install --no-cache-dir -r requirements.txt

# Copy all The Project Folder To /app
COPY . .

# Use Port 5000 Doc
EXPOSE 5000

CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]


