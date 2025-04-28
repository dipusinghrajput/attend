# Use official Python image
FROM python:3.11-slim

# Install necessary system libraries
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    libglib2.0-0 \
    libnss3 \
    libgdk-pixbuf-2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libcups2 \
    libxrandr2 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libpangocairo-1.0-0 \
    libcairo2 \
    libpango-1.0-0 \
    libgdk-pixbuf2.0-0 \
    libenchant-2-2 \
    libsoup-3.0-0 \
    libsecret-1-0 \
    libmanette-0.2-0 \
    libgles2 \
    libdrm2 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements first and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers
RUN python -m playwright install

# Copy all project files
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Expose the port
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
