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

<t:loggedouttemplate>
    <jsp:attribute name="info">
    <form method="post" action="home.jsp">
      <div id="login" class="container">
    			<h3>Please Log In To Use Website</h3>
    			<br />
    			<c:if test = "${not empty attempt}">
    			<p>Not A Valid Account...Try Again</p>
    			</c:if>
			    <label><b>Username</b></label>
			    <input type="text" placeholder="Enter Username" id="username" name="uname" required>
			
			    <label><b>Password</b></label>
			    <input type="password" placeholder="Enter Password" id="password" name="psw" required>
			    <input type="submit" id="login" value="Log In">
			    <h3><br />
    			<br />
    			<br />
    			<br />
    			 OR <input type="button" value="Create Account" onclick="register();"></h3>
			    
	  </div>
	  </form>
    </jsp:attribute>
</t:loggedouttemplate>
<script type="text/javascript">
function register()
{
	window.location.replace("http://localhost:8080/Hotel/register.jsp");
}
</script>
</html>
