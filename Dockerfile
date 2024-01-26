# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js (required for Code Server)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Install Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh



# Expose port for Code Server
EXPOSE 8080



# Start Code Server with customizations and Blue Light Theme
CMD ["code-server", "--auth", "none", "--host", "0.0.0.0", "--bind-addr", "0.0.0.0:8080"]
