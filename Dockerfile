FROM cassandra:3
#TODO: MAINTANER, LABEL, that kind of stuff

COPY init.sh /
COPY prepend.sh /usr/local/bin/prepend

RUN head --lines=-2 /docker-entrypoint.sh > /docker-entrypoint.tmp; \
    echo '/init.sh &' >> /docker-entrypoint.tmp; \
    tail --lines=2 /docker-entrypoint.sh >> /docker-entrypoint.tmp; \
    mv /docker-entrypoint.tmp /docker-entrypoint.sh; \
    chmod +x /docker-entrypoint.sh

# This is what would go to child images
# However, that fails if user wants to add files via some other means. Hence, it's commented out.
#ONBUILD COPY cassandra-fixtures/* /docker-entrypoint-init.d/

