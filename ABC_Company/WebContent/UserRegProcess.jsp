<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
 <c:if test="${ empty param.fname or empty param.lname}">
            <c:redirect url="UserRegistration.jsp" >
                <c:param name="errMsg" value="Please Enter First Name and Last Name" />
            </c:redirect>
 
        </c:if>
         <c:if test="${ empty param.email or empty param.phone}">
            <c:redirect url="UserRegistration.jsp" >
                <c:param name="errMsg" value="Please Enter Email and Phone Number" />
            </c:redirect>
 
        </c:if>
         <c:if test="${ empty param.uname or empty param.password or empty param.cpassword}">
            <c:redirect url="UserRegistration.jsp" >
                <c:param name="errMsg" value="Please Enter UserName and Password" />
            </c:redirect>
 
        </c:if>

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="root"/>
                           <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO user('username','password','cellphone','email','firstname','lastname','address','usertype') VALUES (?,?,?,?,?,?,?,?);
            <sql:param value="${param.uname}" />
            <sql:param value="${param.password}"/>
            <sql:param value="${param.phone}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.fname}" />
            <sql:param value="${param.lname}" />
            <sql:param value="${param.address}" />
            <sql:param value="Customer" />
            
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
            <c:redirect url="Login.jsp" >
            </c:redirect>
        </c:if> 
</body>
</html>