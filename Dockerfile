FROM python:3.12-slim

# Install AWS CLI
RUN apt update -y && apt install -y awscli

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any required packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python", "app.py"]
