#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -o errexit

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt || { echo "Failed to install Python dependencies"; exit 1; }

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput || { echo "Failed to collect static files"; exit 1; }

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate || { echo "Failed to apply database migrations"; exit 1; }

echo "Build completed successfully!"