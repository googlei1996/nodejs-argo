
FROM alpine:latest

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY ech-tunnel .
COPY entrypoint.sh .

RUN chmod +x ech-tunnel entrypoint.sh


EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]
