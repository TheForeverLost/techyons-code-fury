<%@page import="javax.servlet.descriptor.JspPropertyGroupDescriptor"%>
<html>
<body>
<h1> Welcome to Meeting Room Management Admin</h1>
<h3> Name: Pavleen Kaur</h3>
<h3> Email: pavleen.kaur@hsbc.co.in</h3>
<h3> Last Login at: 9:13pm, on Sept 19, 2021</h3>
   <a href="/meetingroommanagement/meetingroom" >View Available Meeting Rooms</a><p>
    <form>
         <input type="button" onclick="window.location.href = 'http://localhost:8080/meetingroommanagement/admin?option=create'" value="Add Meeting Room"/>
     </form>
</body>
</html>