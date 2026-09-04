# Careflow Eureka Server

Minimal Spring Cloud Netflix Eureka service registry running on port `8761`.

## Requirements

- Java 25

Maven is provided through the Maven Wrapper.

## Build

On macOS or Linux:

```sh
./mvnw clean package
```

On Windows:

```powershell
.\mvnw.cmd clean package
```

## Run

On macOS or Linux:

```sh
./mvnw spring-boot:run
```

On Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

The Eureka dashboard is available at <http://localhost:8761> and the actuator
health endpoint at <http://localhost:8761/actuator/health>.
