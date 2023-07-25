FROM alpine:latest

ARG COOK_VERSION=0.1.6

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

ADD https://github.com/cooklang/CookCLI/releases/download/v${COOK_VERSION}/CookCLI_${COOK_VERSION}_linux_amd64.zip /app/CookCLI/CookCLI.zip
RUN unzip /app/CookCLI/CookCLI.zip -d /app/CookCLI
RUN chmod +x /app/CookCLI/cook
RUN rm /app/CookCLI/CookCLI.zip
RUN mkdir -p /cookbook

EXPOSE 9080

CMD ["/app/CookCLI/cook", "server", "/cookbook"]
