FROM cassandra:3
#TODO: MAINTANER, LABEL, that kind of stuff

ADD init.sh /

RUN head --lines=-2 /docker-entrypoint.sh > /docker-entrypoint.tmp; \
    echo '/init.sh &' >> /docker-entrypoint.tmp; \
    tail --lines=2 /docker-entrypoint.sh >> /docker-entrypoint.tmp; \
    mv /docker-entrypoint.tmp /docker-entrypoint.sh; \
    chmod +x /docker-entrypoint.sh

# This is what should go to child images
ADD init.cql /docker-entrypoint-init.d/

