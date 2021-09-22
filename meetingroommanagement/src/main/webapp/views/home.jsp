<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HMeets | Home</title>
</head>
<body style="margin: 0">
	<div style="background-color: #F2F2F2; height: 30vh;">
		<h1 style="margin: 0">Hi</h1>
		<a href="login">
			<button style="height: 1.5rem">Login</button>
		</a>
		<button style="height: 1.5rem" onclick="importUsers()">Import Users</button>
	</div>
	<script type="text/javascript">
		function importUsers() {
			let xhttp = new XMLHttpRequest();
			let method = "POST";
			let url = "http://localhost:8080/meetingroommanagement/";
			xhttp.open(method, url);
			xhttp.send();

			xhttp.onload = function() {
				let importStatus = xhttp.responseText;
				console.log(importStatus);
				// TODO show popup to user with importStatus as messaage
			}
		}
		let allRooms;
		function getMeetings() {
			let xhttp = new XMLHttpRequest();
			let url = "http://localhost:8080/meetingroommanagement/room"
			xhttp.open("POST", url);
			//xhttp.send();

			xhttp.onload = function() {
				let recievedRooms = JSON.parse(xhttp.responseText);
				allRooms = [...allRooms, ...recievedRooms]; // appending additional rooms to current list				
			}
		}
	</script>
</body>
</html>