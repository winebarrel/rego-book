FROM golang:1.27 AS build
RUN go build -o /app .
FROM debian:13.2-slim
ENV LOG_LEVEL=info TZ=UTC
