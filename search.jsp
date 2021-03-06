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
      			<nav style="float:left; max-width: 160px; margin: 0; padding: 1em;">
    			<h3>Search</h3>
    			<form name="searchForm" method="post">
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
                <input type="submit" name="searchsubmit">
    			</form>
    			</nav>
    			<article style="margin-left: 250px; overflow: hidden;">
    			<table id="roomTable">
    			<c:forEach items='${Bean.user.roomArray}' var="item">
                <tr><td style="border-style:solid; width:800px; height:100px; margin:20px">
                <nav style="float:left">
                <%--IMAGE GOES HERE--%>
                <img src="${item.roomID}.png" alt="Image Not Available" onError="this.onError=null;this.src='ImageNotAvailable.png';" width="200" height="200">
                </nav>
                <article style="margin-left: 100px; margin-right: 100px">
                <h3>Room Number: ${item.roomNumber}</h3>
                <p>Price per night: ${item.price} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of Beds: ${item.numBeds} &nbsp;&nbsp;&nbsp;&nbsp;Max Number of Guests: ${item.numGuests}<br>
                Smoking: ${item.smoking} &nbsp;&nbsp;&nbsp;&nbsp; Suite: ${item.suite}</p>
                </article>
                <nav style="float:right; margin-right: 20px; margin-bottom:20px">
                <input type="button" name="bookRoom" value="Book Room">
                </nav>
                </td></tr>   
                </c:forEach>
                </table>
                
	  </div>
      
    </jsp:attribute>
</t:loggedintemplate>
</html>
<%--
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
    			<h3>Filter Results then Search</h3>
                <nav>
    			<form>
    			Number of Guests: <input type="number" name="numGuests"><br><br>
    			Number of Beds: <input type="number" name="numBeds"><br><br>
                Check-in: <input type="date" name="checkInDate"><br><br>
    			Check-out: <input type="date" name="checkOutDate"><br><br>
                <input type="radio" name="smoking" value="Smoking"> Smoking <br>
                <input type="radio" name="smoking" value="Nonsmoking" checked> Non-Smoking <br><br>
                <input type="checkbox" name="suite" value="suite"> Suite<br><br>
                Minimum Price: <input type="number" name="minPrice" min = "0" max = "1000"><br>
                Maximum Price: <input type="number" name="maxPrice" min = "0"
                max = "1000"><br><br>
                <input type="submit" name="submit">
    			</form>
                </nav>
                <article>
                <table id=searchResultTable>

                </table>
                </article>
	  </div>
    </jsp:attribute>
</t:loggedintemplate>
<script type="text/javascript">
function updateSearchResults(){
    var table = document.getElementById("searchResultTable");
}
</script>


</html>

--%>