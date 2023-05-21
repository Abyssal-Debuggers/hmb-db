FROM postgres:15.3
ARG POSTGRES_PASSWORD
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

COPY ./src /usr/src

RUN chmod +x /usr/src/setup.sh && /usr/src/setup.sh
RUN chmod +x /usr/src/entrypoint.sh && /usr/src/entrypoint.sh postgres
RUN rm -rf /usr/src