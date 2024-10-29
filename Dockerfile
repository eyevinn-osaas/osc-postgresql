FROM postgres:17-bullseye

RUN apt-get update && apt-get install -y \
    python3 \
    && rm -rf /var/lib/apt/lists/*
COPY osc-entrypoint.sh /usr/local/bin/
ENV PGDATA=/var/lib/postgresql/data/pgdata
ENTRYPOINT [ "osc-entrypoint.sh" ]

CMD ["postgres"]
