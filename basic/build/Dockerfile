FROM alpine

COPY bas-2.5.tar.gz bas-2.5.tar.gz
RUN apk add build-base flex
RUN tar -xzf bas-2.5.tar.gz
RUN cd bas-2.5 && ./configure && make install
