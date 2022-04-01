docker buildx build --push --progress=plain --platform=linux/amd64,linux/arm64 --build-arg VERSION=0.4.1 --tag bjg96/rathole:latest .
