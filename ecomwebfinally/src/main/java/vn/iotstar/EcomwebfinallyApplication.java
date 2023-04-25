package vn.iotstar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class EcomwebfinallyApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcomwebfinallyApplication.class, args);
	}
	
	@Bean
	public Cloudinary cloudinary() {
		Cloudinary c = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", "djzwxw0ao",
				"api_key", "137985542995866",
				"api_secret", "mwPz2mtnm-7AaOb4uh8UzqGjiHk",
				"secure", true));
		return c;
	}

}
