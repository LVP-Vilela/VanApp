package br.com.tcc.vanApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class VanAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(VanAppApplication.class, args);
	}

}
