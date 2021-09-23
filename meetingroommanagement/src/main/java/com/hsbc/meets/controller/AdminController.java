/**
 * 
 */
package com.hsbc.meets.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsbc.meets.entity.MeetingRoom;
import com.hsbc.meets.factory.MeetingRoomServiceFactory;
import com.hsbc.meets.service.MeetingRoomService;

/**
 * Handles admin page and redirects to other pages
 * 
 * @author alan
 *
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=UTF-8");

		String option = req.getParameter("option");
		
		if (option == null) {
			req.getRequestDispatcher("/admin.jsp").forward(req, resp);
		} else if( option.equals("list")) {
			req.getRequestDispatcher("/meetingroom").forward(req, resp);
		} else if( option.equals("create") ) {
			req.getRequestDispatcher("/addNewRoom.jsp").forward(req, resp);
		} else if( option.equals("edit") ) {
			//req.getRequestDispatcher("/editroom.jsp").forward(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		
	}
	
}
