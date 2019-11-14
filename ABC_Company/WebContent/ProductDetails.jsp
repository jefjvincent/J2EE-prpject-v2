<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
</head>
<body>
<form method=post>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
 
 
<sql:query dataSource="${dbsource}" var="result">
select serialid, productname, colour,warranty_date, price, brandname from product where productname like ? or brandname like ?;
<sql:param value="%${param.searchname}%"/>
<sql:param value="%${param.searchname}%"/>
</sql:query>
Please enter Product name / Brand Name for search <br>
<input type="text" name="searchname" >
<input id="btnSearch" type="submit" value="Search" ><br><br>
        <table border=1>
        <tr>
        <td>Serial ID</td>
        <td>Product Name</td>
        <td>Colour</td>
        <td>Warranty Date</td>
        <td>Price</td>
        <td>Brand Name</td>
        </tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.serialid}"/></td>
<td><c:out value="${row.productname}"/></td>
<td><c:out value="${row.colour}"/></td>
<td><fmt:formatDate pattern="dd-MM-yyyy" value="${row.warranty_date}" /></td>
<td><c:out value="${row.price}"/></td>
<td><c:out value="${row.brandname}"/></td>
</tr>
</c:forEach>
</table>
<a href="AdminDashboard.jsp">Go Home</a>
</form>
</body>
</html>