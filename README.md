# Cassandra Web Docker Image

This docker uses the cassandra-web application at repo [avalanche123/cassandra-web]

Image uses alpine linux.

Image is so small includes only required libraries to run

Default environment variables are:
1. CASSANDRAWEB_HOSTS=127.0.0.1
2. CASSANDRAWEB_PORT=9042
3. CASSANDRAWEB_USERNAME=cassandra
4. CASSANDRAWEB_PASSWORD=cassandra

The image can be run with simple options as:

```
docker run --rm -ti -e CASSANDRAWEB_HOSTS=w.x.y.z -p 3000:3000 kazimsarikaya/cassandra-web:latest
```

The ip address **w.x.y.z** can be a load-balancer address such as kubernetes service.

[avalanche123/cassandra-web]: https://github.com/avalanche123/cassandra-web
