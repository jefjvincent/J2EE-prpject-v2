<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered Product</title>
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
 
 
<sql:query dataSource="${dbsource}" var="result">
select p.serialid, p.productname, p.colour,p.warranty_date, p.price, p.brandname, u.purchasedate from user_product u inner join product p on p.serialid=u.serialid where userid=?;
<sql:param value="${param.uid}"/>
</sql:query>
<c:if test="${not empty result.rows}">
<table border=1>
<tr>
<td>Serial ID</td>
<td>Product Name</td>
<td>Colour</td>
<td>Warranty Date</td>
<td>Price</td>
<td>Brand Name</td>
<td>Purchase Date</td>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.serialid}"/></td>
<td><c:out value="${row.productname}"/></td>
<td><c:out value="${row.colour}"/></td>
<td><fmt:formatDate pattern="dd-MM-yyyy" value="${row.warranty_date}"/></td>
<td><c:out value="${row.price}"/></td>
<td><c:out value="${row.brandname}"/></td>
<td><c:out value="${row.purchasedate}"/></td>
</tr>
</c:forEach>
     </table>
     </c:if>
        <c:if test="${empty result.rows}">
        <h2>No products Registered!!!</h2>
        <h2>Do you want to register new Product?</h2>
        <a href="ProductRegistration.jsp?uname=${param.uname}&uid=${param.uid}">Add Product</a>
        </c:if>
</body>
</html>