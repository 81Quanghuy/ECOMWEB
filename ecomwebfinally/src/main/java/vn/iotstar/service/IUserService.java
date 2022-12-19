package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.User;
import vn.iotstar.service.Impl.UserNotFoundException;

public interface IUserService {

	void deleteAll();

	User getById(Integer id);

	void delete(User entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<User> findById(Integer id);

	<S extends User> Page<S> findAll(Example<S> example, Pageable pageable);

	List<User> findAllById(Iterable<Integer> ids);

	List<User> findAll(Sort sort);

	Page<User> findAll(Pageable pageable);

	List<User> findAll();

	<S extends User> Optional<S> findOne(Example<S> example);

	<S extends User> S save(S entity);

	User login(String username, String password);

	List<User> findByRoleContaining(String role);

	String getFullName(User user);

	List<User> findByUsername(String username);

	List<User> getNewUser(List<User> users);

	void updatePassword(User customer, String newPassword);

	User getByResetPasswordToken(String token);

	void updateResetPasswordToken(String token, String email) throws UserNotFoundException;
}
