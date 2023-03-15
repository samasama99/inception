FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf

RUN useradd -ms /bin/bash redisuser
USER redisuser

CMD ["redis-server", "--protected-mode", "no"]