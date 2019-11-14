<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
</head>
<body>
<form method="post" action="UserRegProcess.jsp">

<table class ="t2"  border="1" height="40%"> 
<tr>
<th colspan="2"><h2>User Registration</h2> <br/>
* Required Field <br/></th>
</tr>
<tr>
<td><label for ="firstName"> First Name*</label><br/>
<input type="text" name ="fname"></td>
</tr>
<tr>
<td><label for="lastName">Last Name*</label><br/>
<input type="text" name ="lname"></td>
</tr>
<tr>
<td><label for ="email"> E-Mail*</label><br/>
<input type="text" name ="email"></td>
</tr>
<tr>
<td><label for ="zip"> Telephone Number*</label><br/>
<input type="text" name ="phone"></td>
</tr>
<tr>
<td><label for ="address"> Address</label><br/>
<textarea rows="4" cols="50"></textarea></td>
</tr>
<tr>
<td colspan="2"><label for ="UserName"> User Name*</label><br/>
<input type="text" name ="uname"></td>
</tr>
<tr>
<td><label for ="password"> Password*</label><br/>
<input type="password" name ="password"></td>
</tr>
<tr>
<td><label for ="confirmPassword"> Confirm Password*</label><br/>
<input type="password" name ="cpassword"></td>
</tr>
<tr>
<tr>
<td colspan="2" ><input type="submit" value="submit" >
<input type="reset" value="Reset">
</td>
</tr>
</table>

</form>
<font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            
  </c:if></font>
       
</body>
</html>