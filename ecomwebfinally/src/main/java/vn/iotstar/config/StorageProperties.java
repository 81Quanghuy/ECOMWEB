package vn.iotstar.config;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StorageProperties {

	@Autowired
	ServletContext application;

	@RequestMapping(value = "images/admin/{photo}", method = RequestMethod.GET)
	@ResponseBody()
	public ResponseEntity<ByteArrayResource> getImageAdmin(@PathVariable("photo") String photo) {
		if (!photo.equals("") || photo != null) {
			try {
				Path filename = Paths.get("src/main/webapp/resources/images/admin", photo);
				byte[] buffer = Files.readAllBytes(filename);
				ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
				return ResponseEntity.ok().contentLength(buffer.length)
						.contentType(MediaType.parseMediaType("image/png")).body(byteArrayResource);
			} catch (Exception e) {

			}
		}
		return ResponseEntity.badRequest().build();

	}

	@RequestMapping(value = "images/seller/{photo}", method = RequestMethod.GET)
	@ResponseBody()
	public ResponseEntity<ByteArrayResource> getImage(@PathVariable("photo") String photo) {
		if (!photo.equals("") || photo != null) {
			try {
				Path filename = Paths.get("src/main/webapp/resources/images/seller", photo);
				byte[] buffer = Files.readAllBytes(filename);
				ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
				return ResponseEntity.ok().contentLength(buffer.length)
						.contentType(MediaType.parseMediaType("image/png")).body(byteArrayResource);
			} catch (Exception e) {

			}
		}
		return ResponseEntity.badRequest().build();

	}

	@RequestMapping(value = "images/user/{photo}", method = RequestMethod.GET)
	@ResponseBody()
	public ResponseEntity<ByteArrayResource> getImageUser(@PathVariable("photo") String photo) {
		if (!photo.equals("") || photo != null) {
			try {
				Path filename = Paths.get("src/main/webapp/resources/images/user", photo);
				byte[] buffer = Files.readAllBytes(filename);
				ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
				return ResponseEntity.ok().contentLength(buffer.length)
						.contentType(MediaType.parseMediaType("image/png")).body(byteArrayResource);
			} catch (Exception e) {

			}
		}
		return ResponseEntity.badRequest().build();

	}
}
