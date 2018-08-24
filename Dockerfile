FROM alpine:edge

RUN apk --no-cache -u add pgpool libmemcached bash postgresql-client

RUN cd /tmp && wget https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.tgz \
  && tar -zxvf forego-stable-linux-amd64.tgz \
  && cp ./forego /usr/bin/ \
  && rm -Rf /tmp/*

COPY ./base/ /

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/

CMD /app/entrypoint.sh