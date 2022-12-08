package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.User;
@Repository
public interface UserRepository extends JpaRepository< User, Integer >{

	List<User> findByRoleContaining(String role);
	List<User> findByUsername(String username);
}
