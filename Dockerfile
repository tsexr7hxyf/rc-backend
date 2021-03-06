FROM alpine

LABEL "com.github.actions.name"="Github Action for rclone"
LABEL "com.github.actions.description"="Wraps the rclone CLI to be used in Github Actions"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/tsexr7hxyf/rc-backend"
LABEL "homepage"="https://github.com/tsexr7hxyf/rc-backend"

RUN apk add --no-cache bash curl unzip ca-certificates fuse openssh-client \
  && wget -qO- https://rclone.org/install.sh | bash \
  && apk del bash curl unzip

ADD *.sh /

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
