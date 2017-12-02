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
<html>
<jsp:useBean id="Bean" class="BookingSystem.BookingSystemBean" scope="session" >
<jsp:setProperty name="Bean" property="*" />
</jsp:useBean>
<% 
if(request.getParameter("newName")!=null&&request.getParameter("newPassword")!=null)
{
	String registerattempt="yes";
	String registername=(String)request.getParameter("newName");
	session.setAttribute("registername",registername);
	session.setAttribute("registerattempt",registerattempt);
	if(Bean.getUser().createUser((String)request.getParameter("newName"),(String)request.getParameter("newPassword")))
	{

		session.setAttribute("username",(String)request.getParameter("newName"));
		session.setAttribute("psw",(String)request.getParameter("newPassword"));
		session.setAttribute("home","yes");
	}
}
%>
<c:if test="${not empty home}">
<c:redirect url="http://localhost:8080/Hotel/home.jsp"/>
</c:if>
<c:redirect url="http://localhost:8080/Hotel/register.jsp"/>
</html>