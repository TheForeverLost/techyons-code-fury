package com.hsbc.meets.service.impl;

import java.io.IOException;
import java.util.List;

import com.hsbc.meets.dao.MeetingRoomDao;
import com.hsbc.meets.dao.impl.MeetingRoomDbDaoImpl;
import com.hsbc.meets.entity.MeetingRoom;
import com.hsbc.meets.exception.MeetingRoomAlreadyExistsException;
import com.hsbc.meets.exception.MeetingRoomAmenitiesInvalidException;
import com.hsbc.meets.exception.MeetingRoomDoesNotExistsException;
import com.hsbc.meets.exception.MeetingRoomNameInvalidException;
import com.hsbc.meets.exception.MeetingRoomSeatingCapacityInalidException;
import com.hsbc.meets.factory.MeetingRoomDaoFactory;
import com.hsbc.meets.service.MeetingRoomService;
import com.hsbc.meets.validation.MeetingRoomValidation;

public class MeetingRoomServiceImpl implements MeetingRoomService{
	MeetingRoomDbDaoImpl dao;

	public MeetingRoomServiceImpl(){
		dao = new MeetingRoomDbDaoImpl();
	}

	@Override
	public List<MeetingRoom> showAllMeetingRooms()
			throws IOException {
		
		List<MeetingRoom> elist = dao.showAllMeetingRooms();
		return elist;
	}

	@Override
	public void addMeetingRoom(int roomId,String roomName , int roomCapacity , String[] roomAmenities)
			throws IOException, MeetingRoomAlreadyExistsException {

		int roomCredits = 0; 
		int creditsPerHour = 0; 
		int sumOfAmenities =0; 
 
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
	}

	@Override
	public int editMeetingRoom(int meetingRoomId, String meetingRoomName, int seatingCapacity, List<String> amenities,
			int creditsPerHour, int rating, int noOfFeedbacks)
			throws MeetingRoomNameInvalidException, MeetingRoomSeatingCapacityInalidException,
			MeetingRoomAmenitiesInvalidException, MeetingRoomDoesNotExistsException, MeetingRoomAlreadyExistsException {
		
		MeetingRoomDao dao = MeetingRoomDaoFactory.getMeetingRoomDaoObject();
		int numberOfRowsUpdate = 0;
		if(MeetingRoomValidation.validateMeetingRoom(dao, meetingRoomId, meetingRoomName, seatingCapacity, amenities)) {
//			MeetingRoom newMeetingRoom = new MeetingRoom(meetingRoomId,meetingRoomName, seatingCapacity, amenities,creditsPerHour,rating,noOfFeedbacks);
//			numberOfRowsUpdate+=dao.updateMeetingRoomById(newMeetingRoom);
//			dao.deleteAmenitiesByMeetingRoomById(newMeetingRoom.getMeetingRoomId());
//			for(String amenityName:amenities) {
//				numberOfRowsUpdate+=dao.insertAmenityInAmenityMeetingRoomById(meetingRoomId, amenityName);
//			}
		}
		return numberOfRowsUpdate;
	}

}
