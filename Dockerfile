FROM alpine

RUN mkdir /app
WORKDIR /tmp

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

RUN curl -fSL "https://github.com/genuinetools/amicontained/releases/download/v0.4.9/amicontained-linux-amd64" -o "/usr/local/bin/amicontained" 
RUN chmod a+x "/usr/local/bin/amicontained"

WORKDIR /app
COPY start.sh .
RUN chmod a+x start.sh

ENTRYPOINT [ "./start.sh" ]

