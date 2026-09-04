package com.careflow.configserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class CareflowConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CareflowConfigServerApplication.class, args);
    }
}
