FROM base

# Install redis
RUN apt-get update
RUN apt-get install -y redis-server

# Run this command when the container starts
ENTRYPOINT  ["/usr/bin/redis-server"]
