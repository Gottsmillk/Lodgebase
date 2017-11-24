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
 <c:remove var="username" scope="session" />
 <c:remove var="psw" scope="session" />
 <c:remove var="attempt" scope="session" />
 <c:remove var="registerattempt" scope="session" />
  <c:remove var="registername" scope="session" />
 <c:remove var="home" scope="session" />
<%response.sendRedirect("/Hotel/index.jsp");%>
</html>