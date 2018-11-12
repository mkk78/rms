package com.mitrais.rms.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mitrais.rms.dao.UserDao;
import com.mitrais.rms.dao.impl.UserDaoImpl;
import com.mitrais.rms.model.User;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends AbstractController
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
    	HttpSession session = req.getSession();
    	
    	if (session.getAttribute("logId") != null) {
        	resp.sendRedirect(req.getContextPath()+"/users/list");
    	} else {
    		String path = getTemplatePath(req.getServletPath());
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
            requestDispatcher.forward(req, resp);
    	}
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserDao userDao = UserDaoImpl.getInstance();
        Optional<User> user = userDao.findByUserNamePassword(req.getParameter("username"), req.getParameter("password"));        
        if (user.isPresent()) {
        	HttpSession session = req.getSession();
        	session.setAttribute("logId", user.get().getId());
        	session.setAttribute("logName", user.get().getUserName());
        	resp.sendRedirect(req.getContextPath()+"/users/list");
        } else {
        	String path = getTemplatePath(req.getServletPath());
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
            requestDispatcher.forward(req, resp);
        }
    }
}
