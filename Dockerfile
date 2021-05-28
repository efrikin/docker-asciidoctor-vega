FROM asciidoctor/docker-asciidoctor:1.3.0

RUN apk add --no-cache npm \
    && apk --virtual .canvas-build-deps add \
    build-base \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    pixman \ 
    cairo \
    pango \
    giflib \
    #  && npm -g config set user root 
    && npm config set user 0 \
    && npm config set unsafe-perm true \
    && npm install --build-from-source -g vega-cli vega vega-lite vega-embed \
    && echo `which vl2vg`
##   && apk del .canvas-build-deps 
##   && apk del -r --no-cache .rubymakedepends

ENV PATH /data/node_modules/.bin:$PATH
ENV NODE_PATH /data/node_modules/
