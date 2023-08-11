package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "main")
@MapperScan(basePackages = "main")
public class ReadmedownApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ReadmedownApplication.class, args);
	}

}
