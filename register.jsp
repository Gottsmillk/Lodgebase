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
<% out.print(session.getAttribute("registername"));%>
<t:loggedouttemplate>
    <jsp:attribute name="info">
    <form method="post" action="middleman/register.jsp">
      <div id="login" class="container">
    			<h3>Create Account</h3>
    			<br />
    			<c:if test = "${not empty registerattempt}">
    			<p>User Name ${sessionScope.registername} has already been taken<br /><br /></p>
    			</c:if>
			    <label><b>Username</b></label>
			    <input type="text" placeholder="Enter Username" id="username" name="newName" required>
			
			    <label><b>Password</b></label>
			    <input type="password" placeholder="Enter Password" id="password" name="newPassword" required>
    			<h3><input type="submit" value="Create Account" onclick="register();"></h3>
			    
	  </div>
	  </form>
    </jsp:attribute>
</t:loggedouttemplate>
<script type="text/javascript">
function logout()
{
	window.location.replace("http://localhost:8080/Hotel/middlman/register.jsp");
}
</script>
</html>
