package com.example.ecommerce_bookstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class EcommerceBookstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcommerceBookstoreApplication.class, args);
	}

}
