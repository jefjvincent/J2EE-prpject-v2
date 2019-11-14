<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Claims Section</title>
<link rel="stylesheet" href="Design.css">
 <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
</head>
<body>
<form method=post>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
<sql:query dataSource="${dbsource}" var="result">
select c.claimid,u.firstname, u.lastname, u.email, p.serialid,p.productname,p.warranty_date,p.brandname,up.purchasedate,c.status
from user u inner join user_product up on
u.userid=up.userid inner join
user_claim c on u.userid=c.userid
inner join product p on p.serialid=c.serialid ;

</sql:query>
Please enter any of User Name / user Id/ First name / Last name / Email for search <br>
<input type="text" name="searchname" >
<input id="btnSearch" type="submit" value="Search" ><br><br>
<table border=1 class="responstable">
<tr>
<th>Name</th>
<th>Email</th>
<th>Serial Id</th>
<th>Product Name</th>
<th>Brand Name</th>
<th>Purchase Date</th>
<th>Warranty Date</th>
<th>Claim Status</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.lastname}, ${row.firstname}"/></td>
<td><c:out value="${row.email}"/></td>
<td><c:out value="${row.serialid}"/></td>
<td><c:out value="${row.productname}"/></td>
<td><c:out value="${row.brandname}"/></td>
<td><c:out value="${row.purchasedate}"/></td>
<td><c:out value="${row.warranty_date}"/></td>
<c:if test="${row.status=='Approved'}"><td><c:out value="${row.status}"/></td></c:if>
<c:if test="${row.status=='InProgress'}"><td><a href="ClaimsDb.jsp?claimid=${row.claimid}&status=Approved">Approve</a> &nbsp&nbsp&nbsp&nbsp<a href="javascript:confirmGo('Sure to reject this claim?','ClaimsDb.jsp?status=Rejected&claimid=<c:out value="${row.claimid}"/>')">Reject</a></td></c:if>
<c:if test="${row.status=='Rejected'}"><td><c:out value="${row.status}"/></td></c:if>
</tr>
</c:forEach>
</table>
<a href="AdminDashboard.jsp">Go Home</a>
</form>
</body>
</html>