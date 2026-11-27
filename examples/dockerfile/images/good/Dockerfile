FROM golang:1.27 AS build
WORKDIR /src
COPY . .
RUN go build -o /app .

FROM debian:13.2-slim
ENV LOG_LEVEL=info
COPY --from=build /app /usr/local/bin/app
USER 10001:10001
CMD ["app"]
