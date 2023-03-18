# Use the official Python 3.8 slim image as the base image
FROM python:3.8-slim

# Set environment variables for better Python behavior
ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

# Update package list and install necessary packages
RUN apt-get update
RUN apt-get install -y python3 python3-pip python-dev build-essential python3-venv ffmpeg

# Create a directory for the application code and set it as the working directory
RUN mkdir -p /code
ADD . /code
WORKDIR /code

# Install Python dependencies from the requirements file
RUN pip3 install -r requirements.txt

# Set the default command to run when starting the container
CMD ["bash"]
