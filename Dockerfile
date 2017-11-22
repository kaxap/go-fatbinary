FROM golang:1.9

ARG project_name
WORKDIR /go/src/$project_name
COPY . /go/src/$project_name
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app .
VOLUME /gobuild