FROM golang:1.14.15-alpine3.11

WORKDIR /simple-go-api/

COPY go.mod go.sum main.go ./

RUN GOOS=linux go build -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=0 /simple-go-api/app .

CMD ["./app"]
