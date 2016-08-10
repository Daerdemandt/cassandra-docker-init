FROM python:2.7
#TODO: MAINTANER, LABEL, that kind of stuff

# cqlsh requires cassandra-driver which builds Cython (unless instructed otherwise), which takes ages
ENV CASS_DRIVER_NO_CYTHON=1
RUN pip install cqlsh

ADD docker-entrypoint.sh /
ENTRYPOINT /docker-entrypoint.sh

# This is what should go to child images
ADD init.cql /docker-entrypoint-init.d/

