FROM golang:1.17

COPY main.go /app/main.go

CMD ["go", "run", "/app/main.go"]