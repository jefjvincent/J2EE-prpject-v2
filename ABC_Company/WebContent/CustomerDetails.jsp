<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers</title>
</head>
<body><form method=post>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
<sql:query dataSource="${dbsource}" var="result">
select userid, firstname, lastname,cellphone, email, address from user where usertype='Customer' and (username like ? or  userid like ? or firstname like ? or lastname like ? or email like ?);
<sql:param value="%${param.searchname}%"/>
<sql:param value="%${param.searchname}%"/>
<sql:param value="%${param.searchname}%"/>
<sql:param value="%${param.searchname}%"/>
<sql:param value="%${param.searchname}%"/>
</sql:query>
Please enter any of User Name / user Id/ First name / Last name / Email for search <br>
<input type="text" name="searchname" >
<input id="btnSearch" type="submit" value="Search" ><br><br>
<table border=1>
<tr>
<td>UserId</td>
<td>FirstName</td>
<td>LastName</td>
<td>Cellphone</td>
<td>Email</td>
<td>Address</td>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.userid}"/></td>
<td><c:out value="${row.firstname}"/></td>
<td><c:out value="${row.lastname}"/></td>
<td><c:out value="${row.cellphone}"/></td>
<td><c:out value="${row.email}"/></td>
<td><c:out value="${row.address}"/></td>
</tr>
</c:forEach>
</table>
<a href="AdminDashboard.jsp">Go Home</a>
</form>
</body>
</html>