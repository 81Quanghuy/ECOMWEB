package vn.iotstar.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.User;
import vn.iotstar.service.impl.UserServiceImpl;

@Service
public class CustomerUserDetailService implements UserDetailsService {

	@Autowired
	UserServiceImpl userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.print("username" + username);
		List<User> user = userService.findByUsername(username);
		if(user.size()>0) {
			User entity = user.get(0);
			List<GrantedAuthority> grantlist = new ArrayList<>();
			GrantedAuthority grant = new SimpleGrantedAuthority(user.get(0).getRole());
			grantlist.add(grant);
			UserDetails userDetail= new org.springframework.security.core.userdetails.User(username, entity.getPassword(), grantlist);
		
			return userDetail;
		}
		else {
			new UsernameNotFoundException("Login fail");
		}
		return null;
	}

	
}
