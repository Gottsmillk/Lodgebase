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
