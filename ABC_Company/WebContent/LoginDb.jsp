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
 <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
 
 
        <sql:query dataSource="${dbsource}" var="result">
            select userid,usertype from user where username= ? and password=?;
            <sql:param value="${param.uname}" />
            <sql:param value="${param.password}" />
        </sql:query>
        <c:if test="${not empty result.rows}">
       <c:forEach var="row" items="${result.rows}">
       <c:if test="${row.usertype =='Admin'}">
        <c:redirect url="AdminDashboard.jsp" >
                <c:param name="susMsg" value="Congratulations ! " />
            </c:redirect>
       </c:if>
        <c:if test="${row.usertype =='Customer'}">
        <c:redirect url="UserDashboard.jsp" >
                <c:param name="susMsg" value="Congratulations ! " />
                <c:param name="uname" value="${param.uname}"></c:param>
                <c:param name="uid" value="${row.userid}"></c:param>
            </c:redirect>
       </c:if>
       </c:forEach>
 
        
            
             </c:if> 
             <c:if test="${empty result.rows}">
       
 
        
            <c:redirect url="Login.jsp" >
                <c:param name="errMsg" value="Invalid User ! " />
            </c:redirect>
             </c:if> 
</body>
</html>