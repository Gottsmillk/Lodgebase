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
    <c:if test=""></c:if>
      <div id="login" class="container">
      <c:if test = "${Bean.user.authority<2}">
	  <c:redirect url="http://localhost:8080/Hotel/index.jsp"/>
	  </c:if>
      <form method="GET" action="http://localhost:8080/Hotel/manager.jsp" name="me" onsubmit="return validate()">
      <h3>Manager</h3>
      <p>
      Smoking Or Non-Smoking<select id="smoking" name="smoking">
	  <option>y</option>
	  <option>n</option>
	  </select>
	  <br />
	  Number Of People<select id="people" name="people">
	  <option>1</option>
	  <option>2</option>
	  <option>3</option>
	  <option>4</option>
	  <option>5</option>
	  <option>6</option>
	  </select>
	  <br />
	  Number Of Beds<select id="beds" name="beds">
	  <option>1</option>
	  <option>2</option>
	  <option>3</option>
	  <option>4</option>
	  <option>5</option>
	  <option>6</option>
	  </select>
	  <br />
	  Price For Room(No change)<br /><input type="text" id="price" name="price">
	  <br />
	  Room Number<br /><input type="text" id="roomNumber" name="roomNumber">
	  <br />
	  Create New Room with Information<input type="submit" id="newRoom" name="newRoom">
	  <br />
	  OR
	  <br />
	  <c:if test = "${Bean.user.buildingRooms(Bean.user.userName)}">
	  </c:if>
	  Edit Room With Infomation<select id="roomNumbers" name="roomNumbers">
	    <c:forEach items="${Bean.user.roomNumbers}" var="item">
		<option>${item}</option>
		</c:forEach>
		</select>
		<input type="submit" id="editRoom" name="editRoom">
		<br />
		OR
		<br />
		Remove Room <select id="removeRooms" name="removeRooms">
	    <c:forEach items="${Bean.user.roomNumbers}" var="item">
		<option>${item}</option>
		</c:forEach>
		</select>
		<input type="submit" id="removeRoom" name="removeRoom">
	</p>
	</form>
		  </div>
	    </jsp:attribute>
</t:loggedintemplate>
<script type="text/javascript">
var flag="";
document.getElementById("newRoom").onclick = function() {
 flag="a";
}
document.getElementById("editRoom").onclick = function() {
     flag="b";
}
function validateNewRoom()
{
	var a=document.me.price.value;
	var b=document.me.roomNumber.value;
	var c = document.getElementById("roomNumbers");
	if(a=="")
	{
		alert('Price is not filled in');
		return false;
	}
	if(b=="")
	{
		alert('Room number is not filled in'+check);
		return false;
	}
	if(a%1!=0)
	{
		alert('Price is not a number');
		return false;
	}
	if(b%1!=0)
	{
		alert('Room Number is not a number');
		return false;
	}
	for(var i=0;i<c.options.length;i++)
	{
		
		if(b==c.options[i].value)
		{
			alert('Room Number already exists for Building. Either change room number or choose to edit ' + b);
			return false;
		}
	}
	return true;
}
function validateChange()
{
	
	var a=document.me.price.value;
	var b=document.me.roomNumber.value;
	var c = document.getElementById("roomNumbers");
	if(a=="")
	{
		alert('Price is not filled in');
		return false;
	}
	if(b=="")
	{
		alert('Room number is not filled in');
		return false;
	}
	if(a%1!=0)
	{
		alert('Price is not a number');
		return false;
	}
	if(b%1!=0)
	{
		alert('Room Number is not a number');
		return false;
	}
	return true;
}
function validate()
{
	if(flag=="a")
		return validateNewRoom();
	else if(flag=="b")
		return validateChange();
	else
	{
		if(confirm('are you sure you want to remove this room?'))
			return true;
		else
			return false;
	}
}
</script>
</html>
