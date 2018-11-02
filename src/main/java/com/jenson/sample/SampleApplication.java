package com.jenson.sample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;

@SpringBootApplication
public class SampleApplication {

    private static final Logger log = LoggerFactory.getLogger(SampleApplication.class);

    public static void main(String[] args) {
        log.info("application started!!");
//        SpringApplication.run(SampleApplication.class, args);
        SpringApplication sa = new SpringApplication(SampleApplication.class);
        sa.addListeners(new ApplicationPidFileWriter());
        sa.run(args);
    }
}
