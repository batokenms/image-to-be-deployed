# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy the script into the container at /app
COPY configuration2.sh /app/configuration2.sh

# Run the script
RUN chmod +x /app/configuration2.sh && /app/configuration2.sh

# Define the command to run the script
CMD ["/bin/bash", "/app/configuration2.sh"]
