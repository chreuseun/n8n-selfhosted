FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install ffmpeg
USER root
RUN apk update && apk add --no-cache ffmpeg

# Switch back to the n8n default user
USER node