
FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY golang .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app .

CMD ["./main"]