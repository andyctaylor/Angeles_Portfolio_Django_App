#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -o errexit

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

echo "Build completed successfully!"