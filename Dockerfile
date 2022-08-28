FROM golang:1.18-alpine AS builder
WORKDIR /Users/sli/playpen/guora
ENV CC=gcc
COPY . .
RUN apk add --no-cache gcc musl-dev \
    && go build ./cmd/guora && mv guora /go/bin
###############
FROM alpine:3.6
COPY --from=builder /go/bin/guora /usr/local/bin
COPY --from=builder /Users/sli/playpen/guora /guora
COPY configuration.example.yaml /etc/guora/configuration.yaml
WORKDIR /guora
CMD "guora" "-init"
