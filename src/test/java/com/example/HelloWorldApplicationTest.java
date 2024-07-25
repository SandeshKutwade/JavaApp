package com.example;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class HelloWorldApplicationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void testHelloWorldEndpoint() {
        ResponseEntity<String> response = restTemplate.getForEntity("/api/hello", String.class);
        assertThat(response.getBody()).isEqualTo("Hello, World!");
    }
}