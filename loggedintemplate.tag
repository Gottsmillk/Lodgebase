<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="info" fragment="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>LodgeBase Booking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webLook.css">
</head>
<jsp:useBean id="Bean" class="BookingSystem.BookingSystemBean" scope="session" >
<jsp:setProperty name="Bean" property="*" />
</jsp:useBean>
<% 
		if (!(Bean.getUser().checkUser((String)session.getAttribute("username"),(String)session.getAttribute("psw"))))
		{
		String attempt="yes";
		session.setAttribute("attempt",attempt);
		String username=request.getParameter("uname");
		session.setAttribute("username",username);
		String password=request.getParameter("psw");
		session.setAttribute("psw",password);
		}
		if (!(Bean.getUser().checkUser((String)session.getAttribute("username"),(String)session.getAttribute("psw"))))
		{
			response.sendRedirect("/Hotel/index.jsp");
		}
%>
<body>
<div class="container-fluid">
  <div class="row content">
    <div id="sidebar" class="col-sm-3 sidenav">
      <h4>LODGEBASE</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="http://localhost:8080/Hotel/home.jsp">Home</a></li>
        <li class="active"><a href="http://localhost:8080/Hotel/search.jsp">Search For A Room</a></li>
        <li class="active"><a href="http://localhost:8080/Hotel/history.jsp">Room History</a></li>
        <c:if test = "${Bean.user.authority>=1}">
        <li class="active"><a href="http://localhost:8080/Hotel/receptionist.jsp">Receptionist Controls</a></li>
        </c:if>
        <c:if test = "${Bean.user.authority>=2}">
        <li class="active"><a href="http://localhost:8080/Hotel/manager.jsp">Manager Controls</a></li>
        </c:if>
        <c:if test = "${Bean.user.authority>=3}">
        <li class="active"><a href="http://localhost:8080/Hotel/support.jsp">Support Controls</a></li>
        </c:if>
      </ul>
    </div>
	<header id="header" class="col-sm-9"><h1>HOTEL BOOKING SERVICE</h1></header>
	
    <div class="col-sm-9">
	    <div id="info" style="display:block;">
	  		<jsp:invoke fragment="info"/>
	    </div>
   	</div>
   </div>
</div>
</body>
</html>
