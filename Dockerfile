# Use the Alpine base image
FROM alpine:latest

# Install rsync
RUN apk update && apk add --no-cache rsync

# Copy local data to /data directory inside the container
COPY ./src /data
