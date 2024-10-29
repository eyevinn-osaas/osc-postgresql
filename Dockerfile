FROM postgres:17-bullseye

RUN apt-get update && apt-get install -y \
    python3 \
    && rm -rf /var/lib/apt/lists/*
COPY osc-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "osc-entrypoint.sh" ]

CMD ["postgres"]