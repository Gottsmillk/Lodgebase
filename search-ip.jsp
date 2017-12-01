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
<style>
nav{
    float:left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}
article {
    margin-left: 250px;
    overflow: hidden;
}
</style>


<t:loggedintemplate>
    <jsp:attribute name="info">
      <div id="login" class="container">
      			<nav>
    			<h3>Filter Results then Search</h3>
    			<form onsubmit="updateSearchResults()" name="searchForm" method="post">
    			Number of Guests: <input type="number" name="numGuests" min = "0" max = "20" required><br><br>
    			Number of Beds: <input type="number" id="numBeds" name="numBeds" min = "0" max = "5" required><br><br>
                Check-in: <input type="date" name="checkInDate"><br><br>
    			Check-out: <input type="date" name="checkOutDate"><br><br>
                <input type="radio" name="smoking" value="Smoking"> Smoking <br>
                <input type="radio" name="smoking" value="Nonsmoking" checked> Non-Smoking <br><br>
                <input type="checkbox" name="suite" value="suite"> Suite<br><br>
                Minimum Price: <input type="number" name="minPrice" min = "0" max = "1000"><br>
                Maximum Price: <input type="number" name="maxPrice" min = "0"
                max = "1000"><br><br>
                <input type="submit" name="Submit">
    			</form>
    			</nav>
    			<article>
    			<table id="roomTable">
    			<c:forEach items='${Bean.user.roomArray}' var="item">
                <tr><td>${item.roomID}</td></tr>   
                </c:forEach>
                </table>
                </article>
	  </div>
      
    </jsp:attribute>
</t:loggedintemplate>
<script type="text/javascript">
				function updateSearchResults(){
					var inputGuests = document.forms["searchForm"]["numGuests"].value;
					var inputBeds = document.forms["searchForm"]["numBeds"].value;
					${Bean.user.updateRoomArray("" + inputGuests, "" + inputBeds,"","")};
					alert("Test");
					alert("" + inputBeds);
					alert("" + inputGuests);
					return true;
				}
				</script>
</html>
