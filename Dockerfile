FROM alpine:latest as build
RUN apk update && \
    apk add ruby ruby-dev make gcc libc-dev g++ && \
    gem install --user-install bundler etc bigdecimal \
                               json bundler cassandra-web


FROM alpine:latest
MAINTAINER Kazım SARIKAYA <kazimsarikaya@sanaldiyar.com>
RUN apk update && \
    apk add ruby libstdc++ && \
    rm -fr /var/cache/apk/*
COPY --from=build /root/.gem/ /root/.gem/
ADD entry-point.sh /
ENTRYPOINT ["/entry-point.sh"]
CMD ["cassandra-web"]
