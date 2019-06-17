FROM showpass/python3-django

RUN apk update
# CircleCI
RUN apk --no-cache add git tar gzip openssl openssh-client nodejs npm

# NPM dependencies
RUN npm install -g gulp \
    && npm install -g bower

# PhantomJS
# https://github.com/Overbryd/docker-phantomjs-alpine/releases/tag/2.11
RUN apk add --no-cache fontconfig && \
    mkdir -p /usr/share && \
    cd /usr/share \
    && curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj \
    && ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs \
    && phantomjs --version

# Firefox
RUN apk add --no-cache bash dbus firefox-esr fontconfig python ttf-freefont xvfb
