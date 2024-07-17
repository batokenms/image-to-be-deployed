# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the script into the container at /app
COPY configuration2.sh /app/configuration2.sh

# Make the script executable
RUN chmod +x /app/configuration2.sh

# Define the command to run the script
ENTRYPOINT ["/app/configuration2.sh"]


