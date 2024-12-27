FROM ubuntu:latest 

RUN apt-get update && apt-get install -y openssh-client 

FROM golang:1.23-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . . 

RUN go build -o /app/app .

EXPOSE 8080

CMD [ "/app/app" ]
