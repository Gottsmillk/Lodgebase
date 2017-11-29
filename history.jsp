<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<%@ page session="true" %>	
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">

<t:loggedintemplate>
    <jsp:attribute name="info">
      <div id="login" class="container">
    			<h3>History</h3>
	  </div>
	  <c:if test = "${Bean.user.userHistory(Bean.user.userName)}">
		  <c:forEach items='${Bean.user.history}' var="check">
		  <div><p>${check}</p></div>
	  		</c:forEach>
	  </c:if>
	 <c:if test = "${!Bean.user.userHistory(Bean.user.userName)}">
		  <div><p>No Rooms have been checked out</p></div>
	  </c:if> 
    </jsp:attribute>
</t:loggedintemplate>
</html>
