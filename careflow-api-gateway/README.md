# Careflow API Gateway

Minimal reactive API gateway built with Java 25, Spring Boot 4.0.8, and Spring Cloud 2025.1.3.

## Features

- Spring Cloud Gateway Server WebFlux
- Eureka service registration and discovery
- Load-balanced routes generated from discovered services
- Spring Boot Actuator

## Prerequisites

- JDK 25
- A Eureka server available at `http://localhost:8761/eureka/`

## Run

On Linux or macOS:

```shell
./mvnw spring-boot:run
```

On Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

The gateway listens on port `8080`. Discovered services are routed through
`/{service-id}/**`; the service ID prefix is removed before forwarding the request.

The health endpoint is available at `http://localhost:8080/actuator/health`.
