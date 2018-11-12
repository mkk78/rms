package com.mitrais.rms.controller;

import com.mitrais.rms.dao.UserDao;
import com.mitrais.rms.dao.impl.UserDaoImpl;
import com.mitrais.rms.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/users/*")
public class UserServlet extends AbstractController {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("logId") != null) {
			UserDao userDao = UserDaoImpl.getInstance();
			String path = getTemplatePath(req.getServletPath() + req.getPathInfo());
			if ("/list".equalsIgnoreCase(req.getPathInfo())) {
				List<User> users = userDao.findAll();
				req.setAttribute("users", users);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
				requestDispatcher.forward(req, resp);
			} else if ("/form".equalsIgnoreCase(req.getPathInfo())) {
				Optional<User> user = userDao.find(Long.parseLong(req.getParameter("id")));
				req.setAttribute("user", user.get());
				RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
				requestDispatcher.forward(req, resp);
			} else if ("/delete".equalsIgnoreCase(req.getPathInfo())) {
				User user = new User(Long.parseLong(req.getParameter("id")), req.getParameter("username"),
						req.getParameter("password"));
				userDao.delete(user);
				resp.sendRedirect(req.getContextPath() + "/users/list");
			} else if ("/register".equalsIgnoreCase(req.getPathInfo())) {
				RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
				requestDispatcher.forward(req, resp);
			} else if ("/logout".equalsIgnoreCase(req.getPathInfo())) {
				session.invalidate();
				resp.sendRedirect(req.getContextPath() + "/login");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao userDao = UserDaoImpl.getInstance();
		User user = new User(null, req.getParameter("username"), req.getParameter("password"));
		
		if ("/register".equalsIgnoreCase(req.getPathInfo())) {
			if (validate(user)) {
				if (userDao.findByUserName(req.getParameter("username")).isPresent()) {
					System.out.println("Username already exist");
					resp.sendRedirect(req.getHeader("referer"));
				} else if (!req.getParameter("password").equals(req.getParameter("cpassword"))) {
					System.out.println("Password not match");
					resp.sendRedirect(req.getHeader("referer"));
				} else {
					userDao.save(user);
					resp.sendRedirect(req.getContextPath() + "/users/list");
				}
			} else {
				System.out.println("User and Password field must be filled");
				resp.sendRedirect(req.getHeader("referer"));
			}
		} else if ("/update".equalsIgnoreCase(req.getPathInfo())) {		
			userDao = UserDaoImpl.getInstance();
			user = new User(Long.parseLong(req.getParameter("id")), req.getParameter("username"),req.getParameter("password"));
			userDao.update(user);
			resp.sendRedirect(req.getContextPath() + "/users/list");
		}
	}
	
	private boolean validate(User user) {
		if ("".equals(user.getUserName())) {
			return false;
		} else if ("".equals(user.getPassword())) {
			return false;
		}
		return true;
	}
}
