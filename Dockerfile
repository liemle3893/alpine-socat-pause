FROM alpine:3.17 as builder
RUN apk add --no-cache build-base

COPY . /app
WORKDIR /app
RUN make build-bin

FROM alpine/socat:1.7.4.4-r0

COPY --from=builder /app/bin/pause /bin/pause

ENTRYPOINT ["/bin/pause"]
