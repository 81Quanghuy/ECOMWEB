package vn.iotstar.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;
import vn.iotstar.service.IUserService;

@Service
//@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	UserRepository UserRepository;

	@Override
	public <S extends User> S save(S entity) {
		return UserRepository.save(entity);
	}

	@Override
	public <S extends User> Optional<S> findOne(Example<S> example) {
		return UserRepository.findOne(example);
	}

	@Override
	public List<User> findAll() {
		return UserRepository.findAll();
	}

	@Override
	public Page<User> findAll(Pageable pageable) {
		return UserRepository.findAll(pageable);
	}

	@Override
	public List<User> findAll(Sort sort) {
		return UserRepository.findAll(sort);
	}

	@Override
	public List<User> findAllById(Iterable<Integer> ids) {
		return UserRepository.findAllById(ids);
	}

	@Override
	public <S extends User> Page<S> findAll(Example<S> example, Pageable pageable) {
		return UserRepository.findAll(example, pageable);
	}

	@Override
	public Optional<User> findById(Integer id) {
		return UserRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return UserRepository.existsById(id);
	}

	@Override
	public long count() {
		return UserRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		UserRepository.deleteById(id);
	}

	@Override
	public void delete(User entity) {
		UserRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public User getById(Integer id) {
		return UserRepository.getById(id);
	}

	public List<User> findByUsername(String username) {
		return UserRepository.findByUsername(username);
	}

	@Override
	public void deleteAll() {
		UserRepository.deleteAll();
	}

	public User login(String username, String password) {
		List<User> user = UserRepository.findByUsername(username);

		if (user.size() > 0) {
			if (user.get(0).getPassword().equals(password))
				return user.get(0);
		}
		return null;
	}

	@Override
	public List<User> findByRoleContaining(String role) {
		return UserRepository.findByRoleContaining(role);
	}

	@Override
	public String getFullName(User user) {
		return user.getFirstName() + user.getLastName();
	}

	@Override
	public List<User> getNewUser(List<User> users) {

		List<User> temp = new ArrayList<User>();

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		for (User user : users) {

			if (user.getCreateat().getDate() == date.getDate()) {
				temp.add(user);
			}

		}
		return temp;
	}

	@Override
	public void updateResetPasswordToken(String token, String email) throws UserNotFoundException {
		User customer = UserRepository.findByEmail(email);
		if (customer != null) {
			customer.setResetpasswordtoken(token);
			UserRepository.save(customer);
		} else {
			throw new UserNotFoundException("Could not find any customer with the email " + email);
		}
	}

	@Override
	public User getByResetPasswordToken(String token) {
		return UserRepository.findByResetpasswordtoken(token);
	}

	@Override
	public void updatePassword(User customer, String newPassword) {
		// BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		// String encodedPassword = passwordEncoder.encode(newPassword);
		customer.setPassword(newPassword);

		customer.setResetpasswordtoken(null);
		UserRepository.save(customer);
	}

}
