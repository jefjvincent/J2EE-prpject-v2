<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form method="post" action="LoginDb.jsp" >
<input type="hidden" name="submitted" value="true">
<c:if test="${param.submitted && empty param.uname}">
          <tr><td></td>
          <td colspan="2"><font color="red">
            Please enter your Name
          </font></td></tr>
        </c:if>
<table class ="t2"  border="1" height="40%"> 
<tr>
<th colspan="2"><h2>Login</h2> <br/>
 <br/></th>
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
<tr>
<td colspan="2" ><input type="submit" value="Login" >
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