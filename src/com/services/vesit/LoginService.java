package com.services.vesit;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.vesit.LoginDao;
import com.dto.vesit.Login;

@Service
public class LoginService {

	@Autowired
	LoginDao loginDao;

	public Login loginUser(Login login) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		System.out.println("LoginService | loginUser");
		return loginDao.loginUser(login);
	}

}
