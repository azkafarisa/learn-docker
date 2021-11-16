FROM golang:1.17-alpine as builder
WORKDIR /app
ADD . /app
RUN cd /app && go build -o hello

FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=builder /app/hello /app
EXPOSE 4000
ENTRYPOINT ./hello

