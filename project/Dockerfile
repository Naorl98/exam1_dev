# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    curl \
    rsync \
    net-tools \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


# Copy project files into the container
COPY . /app

# Set default environment variables
ENV DATABASE_HOST=db
ENV DATABASE_NAME=gutendex
ENV DATABASE_USER=gutendex
ENV DATABASE_PASSWORD=gutendex
ENV DATABASE_PORT=5432
ENV DEBUG=true
ENV ALLOWED_HOSTS=*
ENV SECRET_KEY=gutendex

# Expose port 8000 for the application
EXPOSE 8000

# Add and set entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


# # Base image
# FROM python:3.9-slim

# # Set working directory
# WORKDIR /app
# # Install rsync
# RUN apt-get update && apt-get install -y rsync

# RUN apt-get update && apt-get install -y net-tools


# # Install system dependencies for psycopg2
# RUN apt-get update && apt-get install -y \
#     libpq-dev \
#     gcc \
#     curl \
#     netcat-openbsd \
#     && rm -rf /var/lib/apt/lists/*

# # Copy the requirements file and install Python packages
# COPY requirements.txt .

# RUN pip install --no-cache-dir -r requirements.txt

# # Copy all project files into the container
# COPY . /app

# # ADD /catalog_files/tmp/catalog.tar.bz2 /catalog_files/tmp

# # Expose port 8000 for the application
# EXPOSE 8000

# # Add and set entrypoint script
# COPY entrypoint.sh /entrypoint.sh

# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]


