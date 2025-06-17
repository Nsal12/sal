# Use an official Ubuntu runtime as a parent image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y software-properties-common && \
    apt clean
RUN mkdir -p /app && echo "Tmate Session"
WORKDIR /app

# Expose the correct port
EXPOSE 6080

# Start code-server (listen on all interfaces)
CMD python3 -m http.server 6080 & \
    tmate -F
