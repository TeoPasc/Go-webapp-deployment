FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o /app/app .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/app .

# Install openssh-client 
RUN apk add --no-cache openssh-client 

EXPOSE 8080

CMD [ "/app/app" ] 
