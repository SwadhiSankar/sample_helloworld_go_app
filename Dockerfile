FROM golang:1.23.0

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /sample_helloworld_go_app

# Listen to port 3000
EXPOSE 8080

# Run
CMD ["/sample_helloworld_go_app"]