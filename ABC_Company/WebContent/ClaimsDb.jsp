<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Claims Update</title>
</head>
<body>
<form method=post>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
<sql:update dataSource="${dbsource}" var="result">
update user_claim set status=? where claimid=?;
<sql:param value="${param.status }"/>
<sql:param value="${param.claimid }"/>
</sql:update>
<c:if test="${result>=1}">
            <c:redirect url="ViewClaims.jsp" >
                <c:param name="susMsg" value="Value Updated" />
            </c:redirect>         
        </c:if>
</form>

</body>
</html>