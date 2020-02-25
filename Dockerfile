FROM alpine:latest as build
RUN apk update && \
    apk add ruby ruby-dev make gcc libc-dev g++ git && \
    gem install --user-install bundler etc bigdecimal \
                               json bundler
RUN git clone https://github.com/avalanche123/cassandra-web && \
    cd cassandra-web && gem build cassandra-web.gemspec && \
    gem install --user-install ./cassandra-web-*.gem                              


FROM alpine:latest
MAINTAINER Kazım SARIKAYA <kazimsarikaya@sanaldiyar.com>
RUN apk update && \
    apk add ruby libstdc++ && \
    rm -fr /var/cache/apk/*
COPY --from=build /root/.gem/ /root/.gem/
ADD entry-point.sh /
ENTRYPOINT ["/entry-point.sh"]
CMD ["cassandra-web"]
