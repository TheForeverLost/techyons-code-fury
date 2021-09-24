<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<h3>Edit the Meeting Room !</h3>
<form action="meetingroom" method="POST">
   Meeting Room Name : 
   <input type="text"> <%= request.getParameter("mname")%><p>
   Capacity of the Room : 
   <input type="text"><%= request.getParameter("mcapacity")%><p>
   
   Edit Amenities :<%= request.getParameterValues("amenities")%>  are already present in the room.<p>
   <input type="checkbox"  name="amenities" value="Projector"> Projector  
   <input type="checkbox"  name="amenities" value="Wifi-Connection"> Wifi-Connection 
   <input type="checkbox"  name="amenities" value="Conference-Call-Facility"> Conference Call Facility
   <input type="checkbox"  name="amenities" value="White-Board"> White-Board
   <input type="checkbox"  name="amenities" value="Water-Dispenser"> Water Dispenser
   <input type="checkbox"  name="amenities" value="TV"> TV
   <input type="checkbox"  name="amenities" value="Coffee-Machine"> Coffee Machine 
   <input type ="submit" value ="Update">  
   <!-- this has to look like a button -->
   <input type = "hidden" name="editflag" value="true"/>
   <a href="admin.jsp">Cancel</a>
  
</form>
<p>
</body>
</html>