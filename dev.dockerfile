FROM golang:1.13-buster
RUN go get github.com/cespare/reflex
WORKDIR /app
COPY . .
ENTRYPOINT ["reflex", "-c", "reflex.conf"]
