# Careflow Config Server

Minimal Spring Cloud Config Server backed by local files in `config/`.

- Java: 25
- Server port: 8888
- Active profile: `native`
- GCP project ID: `careflow-cloud-nishini`

Place client configuration files in `config/`, then run the server with an installed Maven distribution:

```shell
mvn spring-boot:run
```
