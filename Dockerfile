# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required packages
RUN pip install --no-cache-dir flask gunicorn

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
