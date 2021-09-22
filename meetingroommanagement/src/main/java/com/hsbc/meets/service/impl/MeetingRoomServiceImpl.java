package com.hsbc.meets.service.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsbc.meets.dao.impl.MeetingRoomDbDaoImpl;
import com.hsbc.meets.entity.MeetingRoom;
import com.hsbc.meets.exception.MeetingRoomAlreadyExistsException;
import com.hsbc.meets.service.MeetingRoomService;

public class MeetingRoomServiceImpl implements MeetingRoomService{
	MeetingRoomDbDaoImpl dao;

	public MeetingRoomServiceImpl(){
		dao = new MeetingRoomDbDaoImpl();
	}

	@Override
	public void showAllMeetingRooms(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<MeetingRoom> elist = dao.showAllMeetingRooms();
		req.setAttribute("elist", elist);
		req.getRequestDispatcher("/roomlist.jsp").forward(req, resp);
		
	}

	@Override
	public void addMeetingRoom(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, MeetingRoomAlreadyExistsException {

		int roomCredits = 0; 
		int creditsPerHour = 0; 
		int sumOfAmenities =0; 
		


		int roomId = Integer.parseInt(req.getParameter("mid"));
		String roomName = req.getParameter("mname");
		int roomCapacity = Integer.parseInt(req.getParameter("mcapacity"));
		String[] roomAmenities = req.getParameterValues("amenities");
 
		if(roomCapacity <=5)
			roomCredits = 0; 
		else if(roomCapacity >5 && roomCapacity <=10)
			roomCredits = 10; 
		else 
			roomCredits = 20; 
				
		for(int i =0; i<roomAmenities.length; i++) {
			if(roomAmenities[i].equalsIgnoreCase("Projector"))
					sumOfAmenities += 5; 
			if(roomAmenities[i].equalsIgnoreCase("Wifi-Connection"))
					sumOfAmenities += 10; 
			if(roomAmenities[i].equalsIgnoreCase("Conference-Call-Facility"))
				sumOfAmenities += 15;
			if(roomAmenities[i].equalsIgnoreCase("White-Board"))
				sumOfAmenities += 5; 
			if(roomAmenities[i].equalsIgnoreCase("Water-Dispenser"))
				sumOfAmenities += 5;
			if(roomAmenities[i].equalsIgnoreCase("TV"))
				sumOfAmenities += 10;
			if(roomAmenities[i].equalsIgnoreCase("Coffee-Machine"))
				sumOfAmenities += 10;
		}
		
		creditsPerHour = roomCredits + sumOfAmenities; 
		
		MeetingRoom room = new MeetingRoom(roomId,roomName, roomCapacity, roomAmenities, creditsPerHour);
		dao.addMeetingRoom(room);
		showAllMeetingRooms(req, resp);
	}

}
