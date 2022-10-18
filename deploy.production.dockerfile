FROM golang:1.18.2-alpine

ARG OS=linux
ARG ARCH=amd64
ARG PORT=10000
ARG HOST=linux

ENV GO111MODULE=on

WORKDIR /blog-api

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN echo $OS $ARCH
RUN CGO_ENABLED=0 GOOS=$OS GOARCH=$ARCH go build -o blog-api

EXPOSE $PORT
ENTRYPOINT ["./blog-api"]