FROM golang:1.22.0-alpine as build

WORKDIR /app

COPY hello.go /app

RUN go build -o /app hello.go

FROM scratch

COPY --from=build /app ./

CMD ["/hello"]