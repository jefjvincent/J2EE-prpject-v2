<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Registration</title>
</head>
<body>
<c:if test="${ empty param.uname or empty param.product or empty param.purchase}">
            <c:redirect url="ProductRegistration.jsp" >
                <c:param name="errMsg" value="Please Enter Mandatory Values" />
            </c:redirect>
 
        </c:if>
        
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/group_project"
                           user="root"  password="12345"/>
  <sql:query dataSource="${dbsource}" var="products">
            select serialid from product where productname= ? ;
            <sql:param value="${param.product}" />
            
        </sql:query>
       
                   
                        <c:set var="serialid" value="${products.rows[0].serialid}"></c:set>
                                    
        <sql:query dataSource="${dbsource}" var="users">
            select userid from user where username= ? ;
            <sql:param value="${param.uname}" />
            
        </sql:query>
       
                   
                        <c:set var="userid" value="${users.rows[0].userid}"></c:set>
        
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO user_product(userid,serialid,purchasedate) VALUES (?,?,?);
            <sql:param value="${userid}" />
            <sql:param value="${serialid}" />
             <sql:param value="${param.purchase}" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="Login.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted" />
            </c:redirect>
        </c:if> 
 
</body>
</html>