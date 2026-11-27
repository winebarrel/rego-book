FROM golang:1.27 AS build
WORKDIR /src
COPY . .
RUN go build -o /app .

FROM debian:latest
ENV LOG_LEVEL=info API_PASSWORD=secret
ADD https://example.com/config.tar.gz /etc/app/
COPY --from=build /app /usr/local/bin/app
USER root
CMD ["app"]
