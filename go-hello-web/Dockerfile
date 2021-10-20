FROM golang:1.13 AS build

WORKDIR $GOPATH/src/go-hello-web
# prime the modules into their own layer for caching
ENV GO111MODULE on
COPY go.mod go.sum ./
RUN go list -e $(go list -m all)

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a go-hello-web
RUN CGO_ENABLED=0 GOOS=linux go test ./...


FROM alpine

#RUN apk -v --no-cache --update add curl

COPY --from=build /go/src/go-hello-web/go-hello-web /usr/local/bin/

EXPOSE 9080

CMD /usr/local/bin/go-hello-web
