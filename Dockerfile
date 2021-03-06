FROM alpine:3.7

LABEL maintainer="WESEEK <info@weseek.co.jp>"

RUN apk add --no-cache \
    coreutils \
    bash \
    tzdata \
    py2-pip \
    mongodb-tools
RUN pip install awscli

# set timezone JST
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV AWS_DEFAULT_REGION=ap-northeast-1

COPY bin /opt/bin
WORKDIR /opt/bin
ENTRYPOINT ["/opt/bin/entrypoint.sh"]
CMD ["backup", "prune", "list"]
