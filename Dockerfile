FROM golang:1.20-alpine

WORKDIR /app

COPY ./bin/app /app/

EXPOSE 8080

CMD ["./app"]
