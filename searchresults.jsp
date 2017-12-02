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
    			<h3>Search Results</h3>
	  </div>
    </jsp:attribute>
</t:loggedintemplate>
</html>
