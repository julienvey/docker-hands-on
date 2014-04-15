FROM julienvey/fullubuntu

# Install redis
RUN apt-get update
RUN apt-get install -y redis-server

# Export the port for the redis-server
EXPOSE 6379

# Run this command when the container starts
ENTRYPOINT  ["/usr/bin/redis-server"]
