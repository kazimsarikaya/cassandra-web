#!/bin/sh

export PATH="/root/.gem/ruby/2.6.0/bin:${PATH}"

_is_sourced() {
[ "${#FUNCNAME[@]}" -ge 2 ] &&
  [ "${FUNCNAME[0]}" = '_is_sourced' ] &&
  [ "${FUNCNAME[1]}" = 'source' ]
}

_main() {
  if [ "${1:0:1}" = '-' ]; then
    set -- cassandra-web "$@"
  fi

  if [ "$1" = 'cassandra-web' ]; then
    if [ "x${CASSANDRAWEB_HOSTS}" != "x" ]; then
      set -- "$@" --hosts ${CASSANDRAWEB_HOSTS}
    else
      set -- "$@" --hosts 127.0.0.1
    fi

    if [ "x${CASSANDRAWEB_PORT}" != "x" ]; then
      set -- "$@" --port ${CASSANDRAWEB_PORT}
    else
      set -- "$@" --port 9042
    fi

    if [ "x${CASSANDRAWEB_USERNAME}" != "x" ]; then
      set -- "$@" --username ${CASSANDRAWEB_USERNAME}
    else
      set -- "$@" --username cassandra
    fi

    if [ "x${CASSANDRAWEB_PASSWORD}" != "x" ]; then
      set -- "$@" --password "${CASSANDRAWEB_PASSWORD}"
    else
      set -- "$@" --password cassandra
    fi

  fi
  exec "$@"
}

if ! _is_sourced; then
  _main "$@"
fi
