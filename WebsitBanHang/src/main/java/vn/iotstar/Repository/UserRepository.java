package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
