ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

ARG ENVIRONMENT

LABEL maintainer="Vasilii Zolotukhin <vasilii.zolotukhin@gmail.com>"

RUN apk add --update --no-cache nginx

COPY nginx.conf /etc/nginx/
COPY app.conf.$ENVIRONMENT /etc/nginx/conf.d/app.conf

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
