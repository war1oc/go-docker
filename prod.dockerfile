# build stage
FROM golang:1.13-alpine AS builder
WORKDIR /app
COPY . .
RUN apk add --no-cache git
RUN go build -v -o go-docker .

# final stage
FROM alpine:latest
WORKDIR /root
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/go-docker .
ENTRYPOINT ./go-docker
