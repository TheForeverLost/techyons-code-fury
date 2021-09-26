/**
 * 
 */
package com.hsbc.meets.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsbc.meets.entity.User;
import com.hsbc.meets.util.Role;

/**
 * @author alan
 *
 */

@WebServlet("/manager")
public class ManagerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User currentUser = (User) req.getSession().getAttribute("user");
		if(currentUser == null || currentUser.getRole() != Role.MANAGER) {
			resp.sendRedirect("/meetingroommanagement/login");
			return;
		}
		
		req.getRequestDispatcher("/views/manager.jsp").forward(req, resp);
		
	}
}

