package com.controller.vesit;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dto.vesit.Login;
import com.services.vesit.LoginService;

@Controller

public class LoginController {

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Login loginUser(@RequestBody Login login, HttpServletRequest request)
			throws NoSuchAlgorithmException {
		Login user = loginService.loginUser(login);
		if (null != user.getUserId()) {
			request.getSession().setAttribute("user", user);
		}
		return user;
	}
	
	@RequestMapping(value = "/getUser", method = RequestMethod.GET)
	@ResponseBody
	public Login getUserInfo (HttpServletRequest request) {
	    Login nUser = (Login) request.getSession().getAttribute("user");
	    return nUser;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public @ResponseBody void employeeLogout(HttpSession session, HttpServletRequest request) {
		request.getSession().setAttribute("user", null);
		session.invalidate();

	}

}