
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
    			<h3>Your Logged in ${Bean.user.userName}</h3>
    			<h3><input type="button" value="Log Out?" onclick="logout();"></h3>
    			
	  </div>
    </jsp:attribute>
</t:loggedintemplate>
<script type="text/javascript">
function logout()
{
	window.location.replace("http://localhost:8080/Hotel/logout.jsp");
}
</script>
</html>
